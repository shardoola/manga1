

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manga/reuseable_widgets/appbar.dart';

final userRef = FirebaseFirestore.instance.collection("users");
class forum extends StatefulWidget {
  @override
  _forumState createState() => _forumState();
}

class _forumState extends State<forum> {
  List<dynamic> users = [];

  @override
  void initState() {
    getusers();
    // TODO: implement initState
    super.initState();
  }

  getusers() async {
    final QuerySnapshot snapshot = await userRef.get();
    setState(() {
      users = snapshot.docs;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
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
