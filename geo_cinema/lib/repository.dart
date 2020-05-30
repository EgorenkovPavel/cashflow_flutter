
import 'dart:io';

import 'package:geocinema/models/film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Repository{

  Future<List<Film>> getFilms() async{
    http.Response response = await http.get('https://geocinema.herokuapp.com/films');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List<Film> films = [];
      for(Map<String, dynamic> item in jsonResponse){
        films.add(Film(id: item['id'], title: item['title'], imagePath: item['image']));
      }
      return films;
    } else {
      throw HttpException('Request failed with status: ${response.statusCode}.');
    }
  }

}