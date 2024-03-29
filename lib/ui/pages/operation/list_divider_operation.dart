import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/domain/models/operation.dart';

class ListDividerOperation extends StatelessWidget {
  final Operation? operation1;
  final Operation operation2;
  final _TitleType _titleType;

  const ListDividerOperation.day(this.operation1, this.operation2, {Key? key})
      : _titleType = _TitleType.DAY,
        super(key: key);

  const ListDividerOperation.month(this.operation1, this.operation2, {Key? key})
      : _titleType = _TitleType.MONTH,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var op1 = operation1?.date;
    var op2 = operation2.date;

    if (op1 == null) {
      return _TitleDivider(date: op2, type: _titleType,);
    } else {
      switch (_titleType) {
        case _TitleType.DAY:
          {
            if (op1.year == op2.year &&
                op1.month == op2.month &&
                op1.day == op2.day) {
              return _EmptyDivider();
            } else {
              return _TitleDivider(date: op2, type: _titleType,);
            }
          }
        case _TitleType.MONTH:
          {
            if (op1.year == op2.year && op1.month == op2.month) {
              return _EmptyDivider();
            } else {
              return _TitleDivider(date: op2, type: _titleType,);
            }
          }
      }
    }
  }
}

class _TitleDivider extends StatelessWidget {
  const _TitleDivider({
    Key? key,
    required this.date, required this.type,
  }) : super(key: key);

  final DateTime date;
  final _TitleType type;

  String _calcTitle(BuildContext context){
    switch (type){
      case _TitleType.DAY:{
        return DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
            .format(date);
      }
      case _TitleType.MONTH:{
        return DateFormat.yMMM(Localizations.localeOf(context).languageCode)
            .format(date);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Divider(),
      Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Text(
          _calcTitle(context),
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}

class _EmptyDivider extends StatelessWidget {
  const _EmptyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider();
  }
}

enum _TitleType { DAY, MONTH }

