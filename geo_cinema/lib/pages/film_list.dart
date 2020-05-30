import 'package:flutter/material.dart';
import 'package:geocinema/models/film.dart';
import 'package:geocinema/widgets/film_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FilmList extends StatefulWidget {
  @override
  _FilmListState createState() => _FilmListState();
}

class _FilmListState extends State<FilmList> {
  List<Film> films = [];

  Future<void> getFilms() async {
    http.Response response = await http.get('https://geocinema.herokuapp.com/films');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      films.clear();
      for(Map<String, dynamic> item in jsonResponse){
        films.add(Film(id: item['id'], title: item['title'], imagePath: item['image']));
      }
      setState(() {

      });
      //print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  @override
  void initState() {
    super.initState();
    getFilms();
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: films
              .map((e) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilmCard(film: e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}


