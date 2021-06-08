import 'package:flutter/material.dart';
import 'package:team_nightingales_app/models/player.dart';


class DetailsPage extends StatelessWidget {
  final Player player;

  const DetailsPage({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('Об игроке'),
      ),
      // body: Body(
      // ),
    );
  }
}
