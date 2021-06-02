import 'package:flutter/material.dart';
import 'package:team_nightingales_app/models/player.dart';

class Body extends StatelessWidget {
  final Player player;
  const Body({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(children: <Widget>[
              Container(
                height: 500,
                decoration: BoxDecoration(gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.grey.shade500,
                    Colors.blueGrey,
                  ]
                )),
              )
            ],),
          )
        ],
      ),
    );
  }
}
