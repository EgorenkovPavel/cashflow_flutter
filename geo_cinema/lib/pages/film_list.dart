import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocinema/models/film.dart';
import 'package:geocinema/repository.dart';
import 'package:geocinema/widgets/film_card.dart';

class FilmList extends StatelessWidget {
  Completer<void> _refreshCompleter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeoCinema'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          _refreshCompleter = Completer();
          BlocProvider.of<FilmListBloc>(context).add(InitialState());
          return _refreshCompleter.future;
        },
        child: BlocBuilder(
          bloc: BlocProvider.of<FilmListBloc>(context)..add(InitialState()),
          builder: (BuildContext context, state) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Error) {
              _refreshCompleter?.completeError(1);
              return Center(
                child: Text(state.message),
              );
            } else if (state is Success) {
              _refreshCompleter?.complete();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: state.films
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilmCard(film: e),
                          ))
                      .toList(),
                ),
              );
            } else
              return SizedBox();
          },
        ),
      ),
    );
  }
}

abstract class FilmListState {}

class Loading extends FilmListState {}

class Error extends FilmListState {
  final String message;

  Error(this.message);
}

class Success extends FilmListState {
  final List<Film> films;

  Success(this.films);
}

abstract class FilmListEvent {}

class InitialState extends FilmListEvent {}

class FilmListBloc extends Bloc<FilmListEvent, FilmListState> {
  final Repository repository;
  List<Film> _films;

  FilmListBloc(this.repository);

  @override
  FilmListState get initialState => Loading();

  @override
  Stream<FilmListState> mapEventToState(FilmListEvent event) async* {
    if (event is InitialState) {
      yield Loading();
      try {
        _films = await repository.getFilms();
        yield Success(_films);
      } on HttpException catch (e) {
        yield Error(e.message);
      }
    }
  }
}
