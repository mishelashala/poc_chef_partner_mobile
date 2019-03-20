import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                )),
            Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'))),
            RaisedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/current_events');
              },
            ),
          ],
        ),
      ),
    ));
  }
}
