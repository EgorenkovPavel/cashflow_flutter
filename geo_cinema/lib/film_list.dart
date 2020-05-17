import 'package:flutter/material.dart';
import 'package:geocinema/cinema_map.dart';
import 'package:geocinema/film_page.dart';
import 'package:geocinema/models/film.dart';

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
                    Text(film.genres.join(', ')),
                    Text(film.countries.join(', ')),
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
                Sessions(),
              ],
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('RESERVE'),
                onPressed: (){
                  //TODO
                },
              ),
              FlatButton(
                child: const Text('VIEW'),
                onPressed: () => FilmPage.open(context, film),
              ),
              IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black45,
                ),
                onPressed: () => CinemaMap.open(context, film),
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.black45,
                ),
                onPressed: () {//TODO
                   },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Sessions extends StatefulWidget {
  @override
  _SessionsState createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {

  List<String> ses = ['4:00PM', '9:00PM'];
  int selected = null;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: ses.map((s) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: ChoiceChip(
          label: Text(s),
          selected: ses.indexOf(s) == selected,
          onSelected: (select){
            setState(() {
              if(select){
                selected = ses.indexOf(s);
              }else{
                selected = null;
              }
            });
          },
        ),
      )).toList(),
    );
  }
}
