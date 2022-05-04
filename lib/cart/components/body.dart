import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/cart/components/checkoutcart.dart';
import 'package:food_app/modal/cart.dart';
import 'package:food_app/modal/products.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Products> cartDetails=Cart().getCart();
  double sum=0.0;
  void initState(){
    super.initState();
    cartDetails.forEach((product) { sum=sum+product.price;});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartDetails.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      GestureDetector(
                        child: CartItem(cartDetails[index],),
                        onTap: (){
                          setState(() {
                            cartDetails.removeAt(index);
                            sum=0.0;
                            cartDetails.forEach((element) {sum = sum + element.price;});
                          });
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
          ),
          CheckOutCart(sum:sum,)
        ],
      ),
    );
  }
}
class CartItem extends StatelessWidget {
  Products product;
  CartItem(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child:Image.asset(product.image),
          ),
          Expanded(child: Text(product.title)),
          Expanded(child: Text(product.price.toString())),
          Icon(Icons.delete_outline)
        ],
      ),
    );
  }
}

