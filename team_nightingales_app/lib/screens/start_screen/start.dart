import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_nightingales_app/customs/customRoute.dart';
import 'package:team_nightingales_app/screens/achievments_screen/achievments_screen.dart';
import 'package:team_nightingales_app/screens/authorization_screen/components/auth.dart';
import 'package:team_nightingales_app/screens/home_screen.dart';
import 'package:team_nightingales_app/screens/todo_screen/todo_screen.dart';
import '../home_screen.dart';
import '../team_screen/team_screen.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  AuthClass _authClass = AuthClass();
  UserModel _userModel;
  int _currentIndex = 0;
  final List<Widget> _children = [
    SingleChildScrollView(child: HomePage()),
    SingleChildScrollView(child: AchievmentsPage()),
    TeamPage(),
  ];
  AuthClass auth = AuthClass();
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
              icon: Icon(Icons.auto_stories_outlined),
              label: 'Достижения',
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
                decoration: BoxDecoration(color: Colors.grey.shade400),
                currentAccountPicture: Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/team-nightingales.appspot.com/o/acc2.png?alt=media&token=c0d88ccb-9890-439d-ab3f-51c5da1e6fc6'),
                    backgroundColor: Colors.grey.shade300,
                    // child: ClipOval(
                    //   child: Image.asset(
                    //     'assets/klement.png',
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                  ),
                ),
                accountName: Text(
                  _authClass.currentuseremail(),
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail:
                    Text('Name', style: TextStyle(color: Colors.black)),
                otherAccountsPictures: [
                  CupertinoButton(
                      child: Icon(
                        Icons.logout_rounded,
                        color: Colors.blueGrey[800],
                      ),
                      onPressed: () async {
                        _userModel = await auth.logout();
                        if (_userModel == null) {
                          Navigator.pop(context);
                        }
                      })
                ],
              ),
              ListTile(
                  onTap: () {
                    Navigator.push(
                        context, MyRoute(builder: (context) => TodoPage()));
                  },
                  leading: Icon(Icons.task_alt_rounded),
                  title: Text(
                    'Задачи',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
