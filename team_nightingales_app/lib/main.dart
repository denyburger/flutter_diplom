import 'package:flutter/material.dart';
import 'package:team_nightingales_app/screens/authorization_screen/authorization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Authorization(),
    );
  }
}
