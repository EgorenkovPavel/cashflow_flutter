import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/category.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:money_tracker/ui/pages/item_card.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryInputPage extends StatefulWidget {
  final OperationType type;

  CategoryInputPage({required this.type});

  static Future<Category?> open(BuildContext context, {required OperationType type}) {
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
  late CategoryCardBloc _bloc;
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<CategoryCardBloc>(context)
      ..initial(widget.type);
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
          _bloc.save(titleController.text);
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
                if (value == null || value.isEmpty) {
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

abstract class CategoryInputPageState {}

class InitialState extends CategoryInputPageState {
  final OperationType type;

  InitialState(this.type);
}

class Saved extends CategoryInputPageState {
  final Category category;

  Saved(this.category);
}

class CategoryCardBloc extends Cubit<CategoryInputPageState> {
  final Repository _repository;

  late OperationType _type;

  CategoryCardBloc(this._repository) : super(InitialState(OperationType.INPUT));

  void initial(OperationType type){
    _type = type;
  }

  Future<void> save(String title) async {
    var category = Category(title: title, type: _type);
    var id = await _repository.insertCategory(category);
    emit(Saved(category.copyWith(id: id)));
  }
}
