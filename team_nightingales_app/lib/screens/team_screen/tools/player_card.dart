import 'package:flutter/material.dart';
import 'package:team_nightingales_app/models/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  final Function press;
  const PlayerCard({
    Key key,
    this.player,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(18),
              ),
                child: Image.asset(player.image),
              ),
            ),
          Text(
              player.nickname,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400),
            ),
          SizedBox(height: 25)
        ],
      ),
    );
  }
}
