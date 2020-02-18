import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_designs/neumorphic_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic Design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        body: Center(
          child: NeumorphicContainer(
            width: 200,
            height:200,
            color: Colors.blue[400],
            child: Center(
              child:Icon(Icons.cloud_circle),
            ),
          ),
        ),
      ),
    );
  }
}
