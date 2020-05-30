import 'package:flutter/material.dart';
import 'package:geocinema/models/film.dart';
import 'package:geocinema/pages/cinema_map.dart';

class FilmPage extends StatelessWidget{

  static const String routeName = '/filmPage';

  static void open(BuildContext context, Film film){
    Navigator.of(context).pushNamed(FilmPage.routeName, arguments: film);
  }

  final Film film;

  const FilmPage({Key key, this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              //TODO
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(film.imagePath, height: 150.0,),
                  SizedBox(width: 8.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(film.title),
                      Text(film.duration.toString()),
                      Text(film.genres.join(', ')),
                      Text(film.countries.join(', ')),
                      OutlineButton(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Text('VIEW ON MAP'),
                          ],
                        ),
                        onPressed: () => CinemaMap.open(context, film),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(film.description),
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 150.0,
                child: Center(
                  child: Text('Here will be a trailer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}