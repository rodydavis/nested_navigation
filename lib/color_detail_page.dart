import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  ColorDetailPage(
      {this.color,
      this.title,
      this.materialIndex: 500,
      this.rootContext}); //changed
  final MaterialColor color;
  final String title;
  final int materialIndex;
  final BuildContext rootContext; //added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          '$title[$materialIndex]',
        ),
      ),
      /*
       changed body to add a button which navigates to the inputPage
       */
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('To InputPage'),
            onPressed: () {
              Navigator.of(rootContext).pushNamed('/inputPage'); //rootContext gives access to MaterialApps Navigator
            },
          ),
          Expanded(
            child: Container(
              color: color[materialIndex],
            ),
          )
        ],
      ),
    );
  }
}
