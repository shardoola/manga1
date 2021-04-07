import 'package:flutter/material.dart';
import 'package:manga/components/rounded_button.dart';
import 'package:manga/constantColor/constantcolors.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class Menuframe extends StatelessWidget {
  final Function gotosignup;
  final Function gotosignin;

  const Menuframe({Key key, this.gotosignup, this.gotosignin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();

    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                  buttonType: ButtonType.google,
                  buttonSize: ButtonSize.large,
                  onPressed: () {
                    print('click');
                  }),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                  buttonType: ButtonType.facebook,
                  buttonSize: ButtonSize.large,
                  onPressed: () {
                    print('click');
                  }),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        InkWell(

          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  title: 'Sign up',
                  onPressed: () {gotosignup();},
                  colour: Colors.red,
                ),
              ],
            ),
          ),
        ),
        InkWell( onTap: (){
          gotosignin();
        },
          child: Text(
            'Already Registered? SIGN IN',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
