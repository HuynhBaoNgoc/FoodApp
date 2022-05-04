import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/modal/utilities.dart';

import 'fragment/account_detail.dart';
import 'fragment/favorite_fragment.dart';
import 'fragment/home_fragment.dart';
import 'fragment/notification_fragment.dart';
import 'homeheader.dart';
import 'menuheader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex=0;
  var flag=true;
  @override
  Widget build(BuildContext context) {
    List<Widget> screen=[
      HomeDetail(),
      FavoriteDetail(Utilities.data),
      NotificationDetail(),
      AccountDetail()
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:flag? HomeHeader(): MenuHeader(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index){
          setState(() {
            selectIndex=index;
            if(selectIndex != 3){
              flag = true;
            }
            else{
              flag=false;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"Account",
          ),
        ],
      ),
      body:SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            screen[selectIndex]
          ],
        ),
      )
    );
  }
}
