





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manga/reuseable_widgets/appbar.dart';

final userRef = FirebaseFirestore.instance.collection("users");

class feed extends StatefulWidget {
  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {

  @override
  void initState() {
    updateUser();
    //createUser();

    // TODO: implement initState
    super.initState();
  }

  createUser() async{
   await  userRef.doc("asadsadad").set({

    "username" : "rcb",
      "postcount" : 0,
      "isAdmin" : false
    });

  }

 updateUser() async {
 final DocumentSnapshot shar =   await userRef.doc("asadsadad").get();
 if(shar.exists){
   shar.reference.update({"username": "csk", "postcount": 0, "isAdmin": false});
 }



    }



        //.update({"username": "John", "postcount": 0, "isAdmin": false});







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: header(context, isAppTitle: true),
        body:  StreamBuilder<QuerySnapshot>(
            stream: userRef.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              final List<Text> children = snapshot.data.docs.map((doc) =>
                  Text(doc['username'])).toList();
              return Container(
                child: ListView(
                  children: children,
                ),
              );
            }));
  }
}

