import 'package:flutter/material.dart';
import 'package:team_nightingales_app/screens/team_screen/body.dart';

class TeamPage extends StatefulWidget {
  TeamPage({Key key}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
       body: Body(
       ),
    );
  }
}