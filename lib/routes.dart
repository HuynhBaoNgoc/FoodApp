import 'package:food_app/Detail/productpage.dart';
import 'package:food_app/cart/cartpage.dart';
import 'package:food_app/category/categorypage.dart';
import 'package:food_app/homepage/homepage.dart';
import 'package:food_app/main.dart';
import 'package:food_app/modal/products.dart';
import 'package:food_app/signup/signuppage.dart';
import 'package:food_app/splashpage.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/signin/signinpage.dart';

final Map<String, WidgetBuilder> routes={
  SignInPage.routeName:(context)=>SignInPage(),
  SplashPage.routeName:(context)=>SplashPage(),
  SignUpPage.routeName:(context)=>SignUpPage(),
  HomePage.routeName:(context)=>HomePage(),
  CategoryPage.routeName:(context)=>CategoryPage(),
  ProductPage.routeName:(context)=>ProductPage(),
  CartPage.routeName:(context)=>CartPage(),
};