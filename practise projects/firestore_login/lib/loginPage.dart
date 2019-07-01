import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
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
                child: Text("Login"),
                color: Colors.blue,
                onPressed: () {
                  _formKey.currentState.save();
                  print(_email);
                  print(_password);
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    password: _password,
                    email: _email,
                  )
                      .then((FirebaseUser user) {
                    Navigator.pushReplacementNamed(context, '/homePage');
                  }).catchError((e) => print(e));
                },
              ),
              SizedBox(height: 5.0),
              Text('Don\'t have an account ?'),
              SizedBox(height: 5.0),
              RaisedButton(
                child: Text("Signup"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signupPage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
