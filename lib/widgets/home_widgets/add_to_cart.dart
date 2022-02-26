
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  Item? catalog;
  AddToCart({
    Key? key,
    this.catalog,
  }) : super(key: key);
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ? true : false;
    return ElevatedButton(
            onPressed: () {
              if (!isInCart) {
                isInCart = isInCart.toggle();
                final _catalog = CatalogModel();
                _cart.catalog = _catalog;
                _cart.add(widget.catalog);
                setState(() {});
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                // ignore: deprecated_member_use
                context.theme.buttonColor,
              ),
              shape: MaterialStateProperty.all(const StadiumBorder()),
            ),
            child:
                isInCart ? const Icon(Icons.done) :const Icon(CupertinoIcons.cart_badge_plus)
                );
  }
}
