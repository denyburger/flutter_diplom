import 'package:flutter/material.dart';
import 'package:team_nightingales_app/customs/customRoute.dart';
import 'package:team_nightingales_app/models/player.dart';

import 'details_screen/details_screen.dart';
import 'tools/player_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Игроки",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: GridView.builder(
                itemCount: players.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => PlayerCard(
                      player: players[index],
                      press: () => Navigator.push(
                          context,
                          MyRoute(
                            builder: (context) => DetailsPage(
                              player: players[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
