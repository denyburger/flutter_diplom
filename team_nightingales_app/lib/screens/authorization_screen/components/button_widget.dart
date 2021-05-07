import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        onPressed: () {},
        child: Text('Log In',
        
      ),
    ));
  }
} 