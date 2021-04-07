

import 'package:flutter/material.dart';

Container CircularProgress(){
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 1000.0),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red),
    ),
  );
}
Container linearProgress(){
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red),
    ),
  );
}