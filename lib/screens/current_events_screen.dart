import 'package:flutter/material.dart';

class CurrentEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return Scaffold(
        appBar: AppBar(title: Text('Poc Chef')),
        body: SafeArea(child: Center(child: Text('Current Events'))));
  }
}
