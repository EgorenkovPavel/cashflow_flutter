import 'package:flutter/material.dart';
import 'package:money_tracker/utils/app_localization.dart';

class ItemCard<T> extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final String title;
  final Widget child;
  final void Function(BuildContext context) onSave;

  ItemCard(
      {Key? key,
      required this.title,
      required this.child,
      required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              child,
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(null),
                  child: Text(
                    AppLocalizations.of(context).cancel.toUpperCase(),
                   ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      onSave(context);
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context).save.toUpperCase(),
                    //style: TextStyle(color: Colors.white),
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
