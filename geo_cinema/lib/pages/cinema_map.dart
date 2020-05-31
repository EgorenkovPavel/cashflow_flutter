import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocinema/models/cinema.dart';
import 'package:geocinema/models/film.dart';
import 'package:geocinema/pages/session_page.dart';
import 'package:geocinema/repository.dart';
import 'package:geocinema/widgets/cinema_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemaMap extends StatefulWidget {
  static const String routeName = '/cinemaMap';

  static open(BuildContext context, Film film) {
    Navigator.of(context).pushNamed(routeName, arguments: film);
  }

  final Film film;

  const CinemaMap({Key key, this.film}) : super(key: key);

  @override
  State<CinemaMap> createState() => CinemaMapState();
}

class CinemaMapState extends State<CinemaMap> {
  Completer<GoogleMapController> _controller;
  MapBloc _bloc;

  static final CameraPosition _moscow = CameraPosition(
    target: LatLng(55.7458008, 37.6566186),
    zoom: 11.9,
  );

  @override
  void initState() {
    super.initState();
    _controller = Completer();
    _bloc = BlocProvider.of<MapBloc>(context)..add(Start(widget.film));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose cinema'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              BlocConsumer(
                bloc: _bloc,
                listenWhen: (prev, current) => current is Position,
                buildWhen: (prev, current) => current is !Position,
                listener: (BuildContext context, state) async {
                  if (state is Position) {
                    final GoogleMapController controller =
                        await _controller.future;
                    controller.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: LatLng(state.lat, state.lon),
                            zoom: state.zoom)));
                  }
                },
                builder: (BuildContext context, state) {
                  if (state is CinemaState) {
                    return GoogleMap(
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: _moscow,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      zoomControlsEnabled: false,
                      markers: state.cinemas
                          .toSet()
                          .map((e) => Marker(
                              markerId: MarkerId(e.name),
                              position: LatLng(e.lat, e.lon)))
                          .toSet(),
                    );
                  }else if(state is Initial){
                    return Center(child: CircularProgressIndicator(),);
                  }else{
                    return SizedBox();
                  }
                },
              ),
              BlocBuilder(
                bloc: _bloc,
                condition: (prev, current) => current is !Position,
                builder: (BuildContext context, state) {
                  if (state is CinemaState && state.selectedCinema != null) {
                    return Positioned(
                      right: 8.0,
                      bottom: 0.0,
                      child: RaisedButton(
                          color: Colors.white,
                          child: Text('VIEW SESSIONS'),
                          onPressed: () => SessionPage.open(
                              context, widget.film, state.selectedCinema)),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          )),
          Container(
            child: BlocBuilder(
              bloc: _bloc,
              condition: (prev, current) => current is !Position,
              builder: (BuildContext context, state) {
                if (state is CinemaState) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.cinemas
                        .map((s) => CinemaCard(
                              cinema: s,
                              onTap: () => _bloc.add(CinemaSelected(s)),
                              checked: s == state.selectedCinema,
                            ))
                        .toList(),
                  );
                }else if(state is Initial){
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  return SizedBox();
                }
              },
            ),
            height: 100.0,
          ),
        ],
      ),
    );
  }
}

abstract class MapState {}

class Initial extends MapState{}

class Position extends MapState {
  final double lat;
  final double lon;
  final double zoom;

  Position({this.lat, this.lon, this.zoom});
}

class CinemaState extends MapState {
  final List<Cinema> cinemas;
  final Cinema selectedCinema;

  CinemaState({this.cinemas, this.selectedCinema});
}

abstract class MapEvent {}

class Start extends MapEvent {
  final Film film;

  Start(this.film);
}

class CinemaSelected extends MapEvent {
  final Cinema cinema;

  CinemaSelected(this.cinema);
}

class MapBloc extends Bloc<MapEvent, MapState> {
  final Repository _repository;
  Film _film;
  List<Cinema> cinemas = [];
  Cinema _selectedCinema;

  MapBloc(this._repository);

  @override
  MapState get initialState =>
      Position(lat: 55.7458008, lon: 37.6566186, zoom: 11.9);

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is Start) {
      yield Initial();
      _film = event.film;

      _repository.checkPermission();
      try {
        Map<String, double> position = await _repository.getCurrentLocation();
        yield Position(lat: position['lat'], lon: position['lon']);
      } catch (e) {}

      cinemas = await _repository.getCinemas(_film);
      yield CinemaState(cinemas: cinemas, selectedCinema: _selectedCinema);
    } else if (event is CinemaSelected) {
      if (event.cinema == _selectedCinema) {
        _selectedCinema = null;

        yield CinemaState(cinemas: cinemas, selectedCinema: _selectedCinema);

        yield Position(lat: 55.7458008, lon: 37.6566186, zoom: 11.9);
      } else {
        _selectedCinema = event.cinema;

        yield CinemaState(cinemas: cinemas, selectedCinema: _selectedCinema);
        yield Position(
            lat: _selectedCinema.lat, lon: _selectedCinema.lon, zoom: 15.0);
      }
    }
  }
}
