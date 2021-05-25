import 'package:flutter/material.dart';
import 'package:team_nightingales_app/screens/play_screen.dart';
import 'package:team_nightingales_app/screens/home_screen.dart';

import '../home_screen.dart';
import '../team_screen.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

int _currentIndex = 0;
final List<Widget> _children = [
  HomePage(),
  PlayPage(),
  TeamPage(),
];

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedFontSize: 15,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
                backgroundColor: Colors.grey.shade600),
            BottomNavigationBarItem(
                icon: Icon(Icons.gamepad_outlined),
                label: 'Play',
                backgroundColor: Colors.grey.shade600),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt),
                label: 'Team',
                backgroundColor: Colors.grey.shade600)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/klement.png',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  accountName: Text('Klement Ivanov'),
                  accountEmail: Text('ivanov13@gmail.com'))
            ],
          ),
        ),
      ),
    );
  }
}
