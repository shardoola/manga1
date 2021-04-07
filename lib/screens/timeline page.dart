import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manga/screens/ActivityFeed.dart';
import 'package:manga/screens/feed.dart';
import 'package:manga/screens/search.dart';
import 'package:manga/screens/upload.dart';

import 'forum.dart';

class timeline extends StatefulWidget {

  @override
  _timelineState createState() => _timelineState();
}

class _timelineState extends State<timeline> {
  PageController pageController;
  int pageIndex = 0;





  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: PageView(
        children: [
         feed(),
        Search(),
        upload(),
          forum(),
    ActivityFeed(),
    ],
    controller: pageController,
    onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
    ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white10,

        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 30.00,),),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded,size: 30.00,),),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded,size: 30.00,),),
          BottomNavigationBarItem(icon: Icon(Icons.forum_outlined,size: 30.00,),),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined,size: 30.00,),),
        ],
      ),
    );
  }
  void onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 100),

    );
  }

  Future<void> logout()async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }
}

