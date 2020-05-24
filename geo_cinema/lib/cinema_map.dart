import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocinema/models/cinema.dart';
import 'package:geocinema/models/film.dart';
import 'package:geolocator/geolocator.dart';
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
  Completer<GoogleMapController> _controller = Completer();

  Geolocator _geolocator;

  int _checked;

  static final CameraPosition _moscow = CameraPosition(
    target: LatLng(55.7458008, 37.6566186),
    zoom: 11.9,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  List<Cinema> cinemas = [
    Cinema(title: 'Formula kino', lat: 55.728089, lon: 37.584724),
    Cinema(title: 'KARO', lat: 55.753314, lon: 37.587466),
    Cinema(title: '5 stars', lat: 55.733121, lon: 37.637380),
  ];

  @override
  void initState() {
    super.initState();

    _geolocator = Geolocator();
    LocationOptions locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    checkPermission();
    //updateLocation();
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
              GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _moscow,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                zoomControlsEnabled: false,
                markers: cinemas
                    .toSet()
                    .map((e) => Marker(
                        markerId: MarkerId(e.title),
                        position: LatLng(e.lat, e.lon)))
                    .toSet(),
              ),
              _checked == null ? SizedBox() : Positioned(
                right: 8.0,
                bottom: 0.0,
                child: RaisedButton(
                  color: Colors.white,
                child: Text('VIEW SESSIONS'),
                onPressed: () {  },),
              ),
            ],
          )),
          Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cinemas
                  .map((s) => CinemaCard(
                        cinema: s,
                        onTap: () => _goToCinema(s),
                        checked: cinemas.indexOf(s) == _checked,
                      ))
                  .toList(),
            ),
            height: 100.0,
          ),
        ],
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),
    );
  }

  Future<void> _goToCinema(Cinema cinema) async {
    if (cinemas.indexOf(cinema) == _checked) {
      setState(() {
        _checked = null;
      });
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_moscow));
    } else {
      setState(() {
        _checked = cinemas.indexOf(cinema);
      });

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(cinema.lat, cinema.lon), zoom: 15.0)));
    }
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
    });
    _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    _geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }

  void updateLocation() async {
    try {
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      final GoogleMapController controller = await _controller.future;
      controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(newPosition.latitude, newPosition.longitude))));
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}

class CinemaCard extends StatelessWidget {
  final Cinema cinema;
  final checked;
  final GestureTapCallback onTap;

  const CinemaCard({Key key, this.cinema, this.onTap, this.checked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: checked ? Colors.amber : Theme.of(context).cardTheme.color,
      child: GestureDetector(
        child: Container(
          height: 150.0,
          width: 100.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://opentalk.org.ua/wp-content/uploads/2019/10/at-the-cinema.jpg'),
                Text(cinema.title),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
