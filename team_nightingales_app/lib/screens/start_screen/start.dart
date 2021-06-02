import 'package:flutter/material.dart';
import 'package:team_nightingales_app/screens/home_screen.dart';

import '../home_screen.dart';
import '../news_screen.dart';
import '../team_screen/team_screen.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

int _currentIndex = 0;
final List<Widget> _children = [
  HomePage(),
  NewsPage(),
  TeamPage(),
];

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 15,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Домой',
              backgroundColor: Colors.grey.shade600),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes_outlined),
              label: 'Новости',
              backgroundColor: Colors.grey.shade600),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'Команда',
              backgroundColor: Colors.grey.shade600)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey.shade500,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400
                ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/klement.png',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  accountName: Text('Klement Ivanov',style: TextStyle(color: Colors.black),),
                  accountEmail: Text('ivanov13@gmail.com', style: TextStyle(color: Colors.black))),
                  ListTile(
                    onTap: () {
                      
                    },
                    leading: Icon(Icons.home),
                    title: Text('Домой',
                    style: TextStyle(fontSize: 15, color: Colors.black87),)
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
