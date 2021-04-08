

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manga/model/userrr.dart';
import 'package:manga/screens/createaccount.dart';
import 'package:manga/screens/timeline%20page.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

final userRef = FirebaseFirestore.instance.collection("users");
final DateTime timestamp = DateTime.now();
userr CurrentUserr;

class SignInshar extends StatefulWidget {
  @override
  _SignInsharState createState() => _SignInsharState();
}

class _SignInsharState extends State<SignInshar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSignIn = false;
  bool google = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String email, password;
  bool _remeberpassword = false;

  void _signIn({String em, String pw}) async {
    final newUser =
        await _auth.createUserWithEmailAndPassword(email: em, password: pw);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Container(
        color: Colors.yellow,
        child: Text('Welcome '),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              onChanged: (textVal) {
                setState(() {
                  email = textVal;
                });
              },
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  hintText: "Enter Email",
                  focusColor: Colors.white,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  ))),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              onChanged: (textVal) {
                setState(() {
                  password = textVal;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  hintText: "Enter Password",
                  focusColor: Colors.white,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  ))),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Colors.red,
                    value: _remeberpassword,
                    onChanged: (newvalue) {
                      setState(() {
                        _remeberpassword = newvalue;
                      });
                    }),
                SizedBox(
                  height: 12.0,
                ),
                Text("Remember Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 12.0,
                ),
                InkWell(
                  onTap: () {
                    _signIn(em: email, pw: password);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 34.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60.0)),
                    child: Text("LOG IN",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  child: SignInButton.mini(
                buttonType: ButtonType.google,
                onPressed: () => signInWithGoogle().whenComplete(() async {
                  createUserFirestore();


                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                 //    builder: (context) => timeline(uid: uid)));
                }),
              )),
              SizedBox(
                width: 12.0,
              ),
              SignInButton.mini(
                buttonType: ButtonType.facebook,
                onPressed: () {},
              ),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Forgot password',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }

  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    final User user = _auth.currentUser;
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential =
            await _auth.signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
          message: 'Missing Google ID Token',
        );
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

   createUserFirestore() async{
     User user = await _auth.currentUser;
      final uid = user.uid;
     DocumentSnapshot shard =  await userRef.doc(user.uid).get();

    if(!shard.exists){
     final username = await  Navigator.push(context,MaterialPageRoute(builder: (context) => createaccount()));
userRef.doc(user.uid).set({
  "id" : user.uid,
  "username": username,
  "photoUrl": user.photoURL,
  "email": user.email,
  "displayName": user.displayName,
  "bio": "",
  "timestamp": timestamp

});


     shard =  await userRef.doc(user.uid).get();

    }

     CurrentUserr = userr.fromDocument(shard);
    print(CurrentUserr);
     print(CurrentUserr.username);

     Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) => timeline()));
   }
}
