import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';

class CategoryParentField<T extends CategoryGroup> extends StatefulWidget {
  final int? initialId;
  final CategoryType type;
  final void Function(int? id) onChange;

  const CategoryParentField({
    super.key,
    required this.initialId,
    required this.type, required this.onChange,
  });

  @override
  State<CategoryParentField> createState() => _CategoryParentFieldState();
}

class _CategoryParentFieldState extends State<CategoryParentField> {
  int? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialId;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration.collapsed(hintText: ''),
        value: _value,
        items: context
            .readCategoryGroups(widget.type)
            .map((e) => DropdownMenuItem<int>(value: e.id, child: Text(e.title)))
            .toList(),
        onSaved: (int? value) {
          setState(() {
            _value = value;
          });
          widget.onChange(value);
        },
        onChanged: (int? value) {
          setState(() {
            _value = value;
          });
          widget.onChange(value);
        },
      ),
    );
  }
}
