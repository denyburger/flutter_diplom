import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
       appBar: AppBar(
         title: Text('Test Page'),
       ),
       body: Center(
         
         child: Text('This is Test Page'),
       ),
    );
  }
}