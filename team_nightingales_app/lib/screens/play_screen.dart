import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
       appBar: AppBar(
         title: Text('Play Page'),
       ),
       body: Center(
         
         child: Text('This is Play Page'),
       ),
    );
  }
}