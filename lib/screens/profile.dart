

import 'package:flutter/material.dart';
import 'package:manga/reuseable_widgets/appbar.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: header(context,titleText: "Profile"),
      body: Text('profile',style: TextStyle(
        color: Colors.white,
      ),),
    );
  }
}
