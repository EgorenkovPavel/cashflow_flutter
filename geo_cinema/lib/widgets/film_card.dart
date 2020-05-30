import 'package:flutter/material.dart';
import 'package:geocinema/models/film.dart';
import 'package:geocinema/pages/cinema_map.dart';
import 'package:geocinema/pages/film_page.dart';

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
                  width: 100,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        film.title,
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 3,
                      ),
                      Text(film.genres.join(', ')),
                      Text(film.countries.join(', ')),
                      Text(film.description),
                    ],
                  ),
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