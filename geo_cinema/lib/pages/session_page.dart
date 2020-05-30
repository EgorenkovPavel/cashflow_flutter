import 'package:flutter/material.dart';

import '../models/cinema.dart';
import '../models/film.dart';

class SessionPage extends StatelessWidget{

  static const String routeName = '/session';

  final Film film;
  final Cinema cinema;

  const SessionPage({Key key, this.film, this.cinema}) : super(key: key);

  static void open(BuildContext context, Film film, Cinema cinema){
    Navigator.of(context).pushNamed(routeName, arguments: {'film':film, 'cinema' : cinema});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cinema.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){
              //TODO
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          DaySessionsCard(),
          DaySessionsCard(),
          DaySessionsCard(),
          DaySessionsCard(),
          DaySessionsCard(),
          DaySessionsCard(),
        ],
      ),
    );
  }
}

class DaySessionsCard extends StatelessWidget{

  final List<String> sessions = [
    '09.00', '12.00', '15.00', '17.30'
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('23 May, Thursday'),
          Divider(),
          Wrap(
            children: sessions.map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: OutlineButton(
                onPressed: () {
                  //TODO
                },
                child: Text(e),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}