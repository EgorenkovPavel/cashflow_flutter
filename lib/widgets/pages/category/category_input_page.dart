import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/item_cards/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryInputPage extends StatefulWidget {
  final OperationType type;

  CategoryInputPage({this.type});

  static Future<Category> open(BuildContext context, {OperationType type}) {
    return showDialog<Category>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: CategoryInputPage(
                type: type,
              ),);
        });
  }

  @override
  _CategoryInputPageState createState() => _CategoryInputPageState();
}

class _CategoryInputPageState extends State<CategoryInputPage> {
  CategoryCardBloc _bloc;
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<CategoryCardBloc>(context)
      ..add(Initial(widget.type));
  }

  @override
  void dispose() {
    super.dispose();
    //_bloc.close();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCardBloc, CategoryInputPageState>(
      bloc: _bloc,
      listener: (context, state){
        if (state is Saved){
          Navigator.of(context).pop(state.category);
        }
      },
      child: ItemCard(
        title: AppLocalizations.of(context).newCategoryCardTitle,
        onSave: (context) {
          _bloc.add(Save(titleController.text));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).titleType,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<CategoryCardBloc, CategoryInputPageState>(
                      builder: (context, state) {
                    if (state is InitialState) {
                      return Text(getOperationTitle(context, widget.type));
                    }else{
                      return SizedBox();
                    }
                  }),
                )
              ],
            ),
            TextFormField(
              autofocus: true,
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppLocalizations.of(context).title,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocalizations.of(context).emptyTitleError;
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

abstract class CategoryCardEvent {}

class Save extends CategoryCardEvent {
  final String title;

  Save(this.title);
}

class Initial extends CategoryCardEvent {
  final OperationType type;

  Initial(this.type);
}

abstract class CategoryInputPageState {}

class InitialState extends CategoryInputPageState {
  final OperationType type;

  InitialState(this.type);
}

class Saved extends CategoryInputPageState {
  final Category category;

  Saved(this.category);
}

class CategoryCardBloc extends Bloc<CategoryCardEvent, CategoryInputPageState> {
  final Repository _repository;

  OperationType _type;

  CategoryCardBloc(this._repository) : super(InitialState(OperationType.INPUT));

  @override
  Stream<CategoryInputPageState> mapEventToState(CategoryCardEvent event) async* {
    if (event is Initial) {
      _type = event.type;
      yield InitialState(_type);
    } else if (event is Save) {
      var category = Category(title: event.title, type: _type);
      var id = await _repository.insertCategory(category);
      yield Saved(category.copyWith(id: id));
    }
  }
}
