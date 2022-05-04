import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Detail/productpage.dart';
import 'package:food_app/modal/products.dart';
import 'package:food_app/modal/utilities.dart';

class CategoryFilter extends StatelessWidget {
  int cateId;
  CategoryFilter(this.cateId);
  @override
  Widget build(BuildContext context) {
    List<Products> tmp=Products.init().where((element) => element.cateID == this.cateId).toList();
    return Container(
      child:ListView.separated(
          itemCount: tmp.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(tmp[index].image),
              ),
              title: Text(tmp[index].title),
              subtitle: Text(tmp[index].price.toString()),
              onTap: (){
                Utilities.data.add(tmp[index]);
                Navigator.pushNamed(context,ProductPage.routeName,arguments: ProductDetailsArguments(product: tmp[index]));
              },
            );
          },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
