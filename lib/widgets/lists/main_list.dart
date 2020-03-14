
import 'package:flutter/material.dart';

abstract class MainList<T> extends Widget{

  void onItemTap(BuildContext context, T item);

  void addItem(BuildContext context);

  void filterList();

}