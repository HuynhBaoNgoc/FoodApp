import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/modal/user.dart';
import 'package:food_app/modal/utilities.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiver/strings.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var email=TextEditingController();
  final password=TextEditingController();
  final confirm=TextEditingController();

  final _formKey=GlobalKey<FormState>();
  final _passKey=GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            emailTextFormField(),
            SizedBox(height: 30,),
            passwordTextFormField(),
            SizedBox(height: 30,),
            confirmTextFormField(),
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    Navigator.pop(context,User(username: email.text,password:confirm.text));
                  }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.green,
                child: Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF6f6f9),
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset("assets\\icons\\facebook-2.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF6f6f9),
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset("assets\\icons\\google-icon.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF6f6f9),
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset("assets\\icons\\twitter.svg"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  TextFormField emailTextFormField(){
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter your mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined),
      ),
      validator:Utilities.validateEmail,
      onSaved: (value){
        setState(() {
          email.text=value;
        });
      },
    );
  }
  TextFormField passwordTextFormField(){
    return TextFormField(
      key:_passKey,
      controller: password,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outline),
      ),
      validator: (passwordKey){
        return Utilities.validatePassword(passwordKey);
      },
    );
  }
  TextFormField confirmTextFormField() {
    return TextFormField(
      controller: confirm,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outline),
      ),
      validator: (confirmPassword) {
        var pass=_passKey.currentState.value;
        return Utilities.confirmPassword(confirmPassword,pass);
      },
      onSaved: (value){
        setState(() {
          confirm.text=value;
        });
      },
    );
  }
}
