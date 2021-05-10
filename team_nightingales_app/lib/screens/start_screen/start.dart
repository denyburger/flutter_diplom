import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: new AppBar(
           title: Text('Menu')
         ),
         drawer: Drawer(
           child: ListView(
             children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Klement'),
               accountEmail: Text('ivanov13@gmail.com'))
             ],
           ),
         ),
       ),
    );
  }
}