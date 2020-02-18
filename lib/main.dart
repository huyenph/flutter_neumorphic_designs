import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_designs/neumorphic_container.dart';
import 'package:flutter_neumorphic_designs/neumorphic_text_field.dart';

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
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: Text('Neumorphic Designs'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              NeumorphicContainer(
                width: 200,
                height: 50,
                color: Colors.grey[350],
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enter something...',
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              NeumorphicContainer(
                width: 200,
                height: 50,
                color: Colors.grey[350],
                child: Center(
                  child: Icon(Icons.cloud_circle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
