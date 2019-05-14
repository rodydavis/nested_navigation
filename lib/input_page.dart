import 'package:flutter/material.dart';

/*
 added the page to demonstrate inputs work
 on this page a BottomNavigation is not allowed!!!
 */

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputPage'),
      ),
      body: Center(
        child: Container(
          child: TextFormField(),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
