import 'package:flutter/material.dart';

import 'app.dart';
import 'input_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*
       changed home to routes and added the routes
       */
      routes: {
        "/": (BuildContext context) => App(),
        "/inputPage": (BuildContext context) => InputPage(),

      }
    );
  }
}

