import 'package:flip_card/flip_card.dart';
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
    return FlipCard(
      front: Container(child: Image.asset(player.image),), 
    back: Container(child: Text(player.nickname),));
  }
}
