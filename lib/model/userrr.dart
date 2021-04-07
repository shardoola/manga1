import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userr{

  final String id;
  final String username;
  final String email;
  final String photoUrl;
  final String displayName;
  final String bio;

  userr({this.id, this.username, this.email, this.photoUrl, this.displayName, this.bio});

  factory userr.fromDocument(DocumentSnapshot doc) {
    return userr(
      id: doc['id'],
      username: doc['username'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      displayName: doc['displayName'],
      bio: doc['bio'],
    );
  }


}