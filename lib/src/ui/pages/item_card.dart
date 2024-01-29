import 'package:flutter/material.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class ItemCard<T> extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final String title;
  final Widget child;
  final void Function(BuildContext context) onSave;

  ItemCard({
    super.key,
    required this.title,
    required this.child,
    required this.onSave,
  });

  void _onSavePressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      onSave(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              child,
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(null),
                    child: Text(context.loc.cancel.toUpperCase()),
                  ),
                  ElevatedButton(
                    onPressed: () => _onSavePressed(context),
                    child: Text(
                      context.loc.save.toUpperCase(),
                      style: const TextStyle().copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
