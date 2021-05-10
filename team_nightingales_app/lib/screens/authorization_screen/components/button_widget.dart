import 'package:flutter/material.dart';
import 'package:team_nightingales_app/screens/start_screen/start.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>StartPage()));
        },
        child: Text('Log In',
        
      ),
    ));
  }
} 