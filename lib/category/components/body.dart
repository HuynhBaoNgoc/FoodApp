import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/homepage/components/homeheader.dart';
import 'package:food_app/modal/cart.dart';

import 'categoryfilter.dart';

class Body extends StatelessWidget {
  int cateId;
  Body(this.cateId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeHeader(),
      ),
      body: CategoryFilter(cateId),
    );
  }
}
