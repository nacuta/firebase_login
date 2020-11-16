import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/mainPage.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _displayName = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _displayName,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical:16),
                    child: OutlineButton(
                      onPressed: ()async {
                        if(_formKey.currentState.validate()){
 _registerAccount();
                        }
                      },
                      child: Text("Register"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _registerAccount() async{
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text, 
      password: _passwordController.text))
      .user;
      if(user!=null){
        if(!user.emailVerified){
          await user.sendEmailVerification();
        }
        await user.updateProfile(displayName:_displayName.text);
        final user1 = _auth.currentUser;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return MainPage(user: user1,);
        }));
      }

  }
}
