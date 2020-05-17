import 'package:flutter/material.dart';
import 'package:geocinema/cinema_map.dart';

class FilmList extends StatelessWidget {
  final List<Film> films = [
    Film('Batman'),
    Film('Titanic'),
    Film('Jopa'),
    Film('Varejka')
  ];

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
                    child: FilmCard(
                          film: e,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class FilmCard extends StatelessWidget {
  final Film film;

  const FilmCard({Key key, this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  film.imagePath,
                  height: 150,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      film.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(film.genres
                        .reduce((value, element) => value + ', ' + element)),
                    Text(film.contries
                        .reduce((value, element) => value + ', ' + element)),
                    Text(film.description),

                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(),
                Text('In favorite cinema'),
                Wrap(
                  children: <Widget>[
                    ChoiceChip(
                      label: Text('4:00PM'),
                      selected: false,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    ChoiceChip(
                      label: Text('9:00PM'),
                      selected: true,
                    ),

                  ],
                ),
              ],
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('RESERVE'),
                onPressed: (){},
              ),
              FlatButton(
                child: const Text('VIEW'),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black45,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return CinemaMap();
                      }));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.black45,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Film {
  final String title;
  final String imagePath =
      'https://avatars.mds.yandex.net/get-kinopoisk-image/1704946/c6adfa98-a415-4565-bacf-38855e4919a6/x1000';
  final List<String> genres = ['Comedy'];
  final String description = 'Description of the film';
  final List<String> contries = ['USA'];

  Film(this.title);
}
