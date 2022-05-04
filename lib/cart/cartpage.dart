import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/cart/components/body.dart';

class CartPage extends StatelessWidget {
  static String routeName="/cartpage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child:Icon(Icons.arrow_back),
        ),
        title:Text("Cart Detail"),
      ),
      body:Body(),
    );
  }
}
