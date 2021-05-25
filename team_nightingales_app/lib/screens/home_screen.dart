import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
       body: Column(
         children: [
           Center(
             child: Container(
               width: 400,
               child: Image.asset('assets/logo.png')),
           ),
           Text('Welcome, Artour',
           style: TextStyle(
             fontSize: 20.0
           ),)
         ],
       ),
    );
  }
}