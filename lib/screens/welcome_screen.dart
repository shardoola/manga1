import 'package:flutter/material.dart';
import 'package:manga/components/rounded_button.dart';
import 'package:manga/constants/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Color(0XFF191A1E),
        body: SafeArea(
        child:Expanded(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Column(
      children: [
          Container(
          child: Image(
          image: AssetImage('images/Logo.png'),
            height: 100,
            width: 100,
          ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Container(
              child: Text(
                'Weebnet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Text(
                'Please login to discover 10000+ manga & Anime Fans',
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15
                ),
              ),
            ),
          )
      ],
      ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            cursorColor: Colors.blueGrey,
            onChanged: (value) {
              email = value;
            },
            decoration:
            kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            onChanged: (value) {
              password = value;
            },
            decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password'),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.00,vertical: 00.00),
          child: RoundedButton(

            title: 'Sign in',
              onPressed:(){
          },
              colour: Colors.red,
          ),

        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.00,vertical: 00.00),
          child: SignInButton(
              buttonType: ButtonType.google,
              onPressed: () {
                print('click');
              }),


        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.00,vertical: 00.00),
          child: SignInButton(
              buttonType: ButtonType.facebook,
               elevation: 10,
              onPressed: () {
                print('click');
              }),


        ),
      ],
      )

        ),

        )),
    );
  }
}
