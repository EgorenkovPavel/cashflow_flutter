
import 'package:flutter/material.dart';
import 'package:geocinema/models/cinema.dart';

class CinemaCard extends StatelessWidget {
  final Cinema cinema;
  final checked;
  final GestureTapCallback onTap;

  const CinemaCard({Key key, this.cinema, this.onTap, this.checked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: checked ? Colors.amber : Theme.of(context).cardTheme.color,
      child: GestureDetector(
        child: Container(
          height: 150.0,
          width: 100.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://opentalk.org.ua/wp-content/uploads/2019/10/at-the-cinema.jpg'),
                Flexible(child: Text(cinema.name)),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}