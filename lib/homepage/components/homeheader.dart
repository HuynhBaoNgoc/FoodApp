import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/cart/cartpage.dart';
import 'package:food_app/cart/components/body.dart';
import 'package:food_app/modal/cart.dart';
import 'package:food_app/modal/products.dart';

class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int count;


  @override
  Widget build(BuildContext context) {
    count = Cart.cart.length;
    return Row(
      children: [
        Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search Product ",
                prefixIcon: Icon(Icons.search)
              ),
            ),
        ),
        Container(
          child: new Badge(

            position: BadgePosition.topEnd(top: 5, end: 0),

            badgeContent: Text(
              count.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child:
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
              onPressed: (){
                  final result = Navigator.pushNamed(context, CartPage.routeName);
                  result.then((value){
                    setState(() {
                      count=Cart.cart.length;
                    });
                  });
              },
            ),
          ),
        ),
      ],
    );
  }
}



