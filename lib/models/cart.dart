import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/items.dart';
import 'package:flutter_application_1/widgets/home_widgets/ModelList.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
  late Model _model;

  final List<int> _list = [];
  Model get model => _model;

  set model(Model newModel) {
    assert(newModel != null);
    _model = newModel;
  }

  List<Item> get items => _list.map((id) => _model.getByID(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _list.add(item.id);
  }

  void remove(Item item) {
    _list.remove(item.id);
  }
}
