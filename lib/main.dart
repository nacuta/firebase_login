import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/firabaseAuthDemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(home: FirebaseAuthDemo(),
    debugShowCheckedModeBanner: false,
    );
   
    
  }
}