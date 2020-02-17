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
        backgroundColor: Colors.blueGrey.shade200,
        
        body: Center(
          child: NeumorphicContainer(
            child: Text('Neumorphic'),
          ),
        ),
      ),
    );
  }
}
