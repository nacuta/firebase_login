import 'package:firebase_login/register.dart';
import 'package:firebase_login/sign.dart';
import 'package:firebase_login/signIn.dart';
import 'package:flutter/material.dart';

class FirebaseAuthDemo extends StatefulWidget {
  FirebaseAuthDemo({Key key}) : super(key: key);

  @override
  _FirebaseAuthDemoState createState() => _FirebaseAuthDemoState();
}

class _FirebaseAuthDemoState extends State<FirebaseAuthDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebaseAuth"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: OutlineButton(
              onPressed: () {
                _push(context, Sign());
              },
              child: Text("Sign In"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: OutlineButton(
              onPressed: () {
                _push(context, Register());
              },
              child: Text("Register"),
            ),
          ),
        ],
      ),
    );
  }
  void _push(BuildContext context, Widget page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return page;
    }));
  }
}
