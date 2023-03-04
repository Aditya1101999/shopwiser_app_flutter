import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/items.dart';

class AddtoCart extends StatefulWidget {
  final Item Catalog;
  const AddtoCart({
    Key? key,
    required this.Catalog,
  }) : super(key: key);

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.Catalog) ?? false;
    return ElevatedButton(
        onPressed: (() {
          if(!isInCart){
          isInCart = isInCart.toggle();
          final _catalog = Model();
          _cart.model = _catalog;
          _cart.add(widget.Catalog);
          setState(() {});
          }
        }),
        style: ButtonStyle(
            // ignore: deprecated_member_use
            backgroundColor:
                // ignore: deprecated_member_use
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
