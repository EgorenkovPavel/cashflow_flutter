import 'dart:io';

import 'package:geocinema/models/cinema.dart';
import 'package:geocinema/models/film.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Repository {
  Geolocator _geolocator = Geolocator();

  Future<List<Film>> getFilms() async {
    http.Response response =
        await http.get('https://geocinema.herokuapp.com/films');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List<Film> films = [];
      for (Map<String, dynamic> item in jsonResponse) {
        films.add(Film(
            id: item['id'], title: item['title'], imagePath: item['image']));
      }
      return films;
    } else {
      throw HttpException(
          'Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<Cinema>> getCinemas(Film film) async {
    http.Response response =
        await http.get('https://geocinema.herokuapp.com/cinemas/${film.id}');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List<Cinema> cinemas = [];
      for (Map<String, dynamic> item in jsonResponse) {
        cinemas.add(Cinema(
            id: item['id'],
            name: item['name'],
            lat: item['lat'],
            lon: item['lon'],
            address: item['address']));
      }
      return cinemas;
    } else {
      throw HttpException(
          'Request failed with status: ${response.statusCode}.');
    }
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

  Future<Map<String, double>> getCurrentLocation() async {
    try {
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      return {'lat': newPosition.latitude, 'lon': newPosition.longitude};
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
