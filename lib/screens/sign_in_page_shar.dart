import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga/components/rounded_button.dart';
import 'package:manga/constantColor/constantcolors.dart';
import 'package:manga/screens/login_in2.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

import 'login_screen.dart';
import 'menu_frame.dart';

class Signinpage extends StatefulWidget {

  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  PageController pageController = PageController();
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
              child: Column(
                children: [
                  Tab(
                    icon: Container(
                      child: Image(
                        image: AssetImage(
                          'images/Logo.png',
                        ),
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "WEEB",
                      style: TextStyle(
                          fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                          color: constantColors.redcolor),
                    ),
                    Text(
                      "NET",
                      style: TextStyle(
                          fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ]),
                  Text(
                    'Please login to discover 10000+ manga & Anime Fans',
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Expanded(
                    child: PageView(
                     // physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: [
                        Menuframe(
                          gotosignin: (){
                            pageController.animateToPage(1, duration: Duration(
                              milliseconds: 200
                            ), curve: Curves.easeIn);
                          },
                          gotosignup: (){
                            pageController.animateToPage(2, duration: Duration(
                                milliseconds: 200
                            ), curve: Curves.easeIn);
                          },
                        ),
                        SignInshar(

                        ),
                        LoginScreen(
                            CancelBackTohome: (){
                              pageController.animateToPage(0, duration: Duration(
                                  milliseconds: 200
                              ), curve: Curves.easeIn);
                            }
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: constantColors.black3color,
            ),
          ),
        ),
      ),
    );
  }
}
