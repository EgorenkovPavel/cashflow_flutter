import 'package:geocinema/models/cinema.dart';
import 'package:geocinema/models/film.dart';

class Session{

  final Film _film;
  final Cinema _cinema;
  final DateTime _date;
  final bool _3d;

  Session(this._film, this._cinema, this._date, this._3d);

}