import 'package:firestore_login/services/userManagement.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup page"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                onSaved: (String value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                onSaved: (String value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Signup"),
                color: Colors.blue,
                onPressed: () {
                  _formKey.currentState.save();                  
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((FirebaseUser signedInUser) {
                    UserManagement().storeNewUser(signedInUser, context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              SizedBox(height: 20.0),
              OutlineButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/loginPage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
