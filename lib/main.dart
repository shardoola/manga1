import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manga/constantColor/constantcolors.dart';
import 'package:manga/screens/sign_in_page_shar.dart';
import 'screens/create_account.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WeebNet());
}

class WeebNet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
 return MaterialApp(
   debugShowCheckedModeBanner: false,
   theme: ThemeData(
     visualDensity: VisualDensity.adaptivePlatformDensity
   ),
   home: Signinpage(),



 );



  }
}



// return MaterialApp(
     // initialRoute: WelcomeScreen.id,
     // routes: {
       // '/':(context) => WelcomeScreen(),
        // CreateAccount.id: (context) => CreateAccount(),
       // LoginScreen.id: (context) => LoginScreen(),
     // },
  //  );
