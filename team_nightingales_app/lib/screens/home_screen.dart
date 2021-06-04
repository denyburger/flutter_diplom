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
      backgroundColor: Colors.grey.shade500,
      body: Column(
        children: [
          Center(
            child: Container(width: 400, child: Image.asset('assets/logo.png')),
          ),
          Text(
            'Добро пожаловать',
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
