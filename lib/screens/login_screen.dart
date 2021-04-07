import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga/constantColor/constantcolors.dart';

class LoginScreen extends StatefulWidget {
  final Function CancelBackTohome;
  // static const String id = 'login_screen';

  const LoginScreen({Key key, this.CancelBackTohome}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  _auth = FirebaseAuth.instance;
  bool saveAttempted = false;
  String email, password, confirmpassword;
  final formkey = GlobalKey<FormState>();
 bool  _termsAgreed = false;

 void _createUser({String email, String pw}) async {
   final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
       return Container(
         color: Colors.yellow,
         child: Text('Welcome '),
       );
     }));

   }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text("create your account",style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
              ),
              SizedBox(
                height:  20.0,
              ),
              TextFormField(
                autovalidate: saveAttempted,
                onChanged: (textValue){
                  setState(() {
                    email = textValue;
                  });

                },
                validator: (emailValue){
                  if(emailValue.isEmpty){
                    return "This Field is mandotory";
                  }
                  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                      "\\@" +
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                      "(" +
                      "\\." +
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                      ")+";
                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(emailValue)) {
                    // So, the email is valid
                    return null;
                  }

                  return "This is not valid email";
                },
                decoration:InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6)
                  ),
                  hintText: "Enter Email",focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                  color: Colors.white,
                ))),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ) ,
              ),
              SizedBox(
                height:  12.0,
              ),
              TextFormField(
                autovalidate: saveAttempted,
                onChanged: (textValue){
                  setState(() {
                    password = textValue;
                  });

                },
                validator: (pwValue){
                  if(pwValue.isEmpty){
                    return "This Field is mandotory";
                  }
                  if(pwValue.length < 8){
                    return 'password must be at least 8 characters';
                  }
                  return null;
                },
                obscureText: true,
                decoration:InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6)
                    ),
                    hintText: "enter password",focusColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                      color: Colors.white,
                    ))),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ) ,
              ),
              SizedBox(
                height:  12.0,
              ),
              TextFormField(
                onChanged: (textValue){
                  setState(() {
                    confirmpassword = textValue;
                  });

                },
                validator: (pwConValue){
                if(pwConValue != password ){
                  return "Password must match";
                }
                return null;
              },
                obscureText: true,
                decoration:InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6)
                    ),
                    hintText: "re-enter password",focusColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                      color: Colors.white,
                    ))),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ) ,
              ),
              SizedBox(
                height:  12.0,
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.red,
                      value: _termsAgreed, onChanged: (newvalue){
                    setState(() {
                      _termsAgreed = newvalue;
                    });

                  }),
                  SizedBox(
                    height:  12.0,
                  ),
                  Text("Agreed to terms & condition", style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    )

                  ),
                ],
              ),
              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  InkWell( onTap: (){
                    widget.CancelBackTohome();
                  },
                    child: Text("Cancel",style: TextStyle(color: Colors.white,
                    fontSize: 20.0,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width:  30.0,
                  ),
                  InkWell(

                    onTap: (){
                      setState(() {
                        saveAttempted = true;
                      });
                      if(formkey.currentState.validate()){
                        formkey.currentState.save();
                        _createUser(email: email, pw:password);


                      }
                    },
                    child: Container( padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 34.0),
                      decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                      child: Text("Save",style: TextStyle(color: Colors.red,
                          fontSize: 20.0,fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height:  12.0,
              ),
Text(
  "Agreed to terms& Condition",style: TextStyle(color: Colors.white),
),
            ],
          ),




        ),
      ),
    );
  }
}
