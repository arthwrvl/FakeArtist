import 'dart:math';

import 'package:fake_artist/classes/player.dart';
import 'package:fake_artist/data/players.dart';
import 'package:fake_artist/pages/edit_player.dart';
import 'package:fake_artist/pages/resume.dart';
import 'package:fake_artist/styles/colors.dart';
import 'package:fake_artist/styles/drawings.dart';
import 'package:fake_artist/widgets/blank_player_card.dart';
import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class PlayerGrid extends StatefulWidget {
  const PlayerGrid({super.key});

  @override
  State<PlayerGrid> createState() => _PlayerGridState();
}

class _PlayerGridState extends State<PlayerGrid> {
  List<Player> playerClasses = List.empty(growable: true);
  Random rd = Random();
  bool start = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (start) {
      start = false;
      for (int i = 0; i < 5; i++) {
        playerClasses.add(Player(
            "Jogador ${i + 1}",
            colors[rd.nextInt(colors.length)],
            icons[rd.nextInt(icons.length)]));
      }
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Jogadores: ${playerClasses.length}"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 1.28,
            child: ReorderableGridView.count(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 0.7712418301,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  final element = playerClasses.removeAt(oldIndex);
                  playerClasses.insert(newIndex, element);
                });
              },
              footer: [
                BlankCard(
                  onTap: () {
                    setState(() {
                      addPlayer(Player(
                          "Jogador ${playerClasses.length + 1}",
                          colors[rd.nextInt(colors.length)],
                          icons[rd.nextInt(icons.length)]));
                    });
                  },
                )
              ],
              children: playerClasses
                  .map(
                    (Player player) => PlayerCard(
                      key: ValueKey(playerClasses.indexOf(player)),
                      player: player,
                      size: size.width * 0.3,
                      showPoints: false,
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditPlayer(player: player)))
                            .then((value) => setState(
                                  () {},
                                ));
                      },
                      onDoubleTap: () {
                        setState(() {
                          removePlayer(player);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomButton(
                disabled: playerClasses.length < 4,
                buttonText: "Avançar",
                onPressed: () {
                  if (playerClasses.length >= 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Resume(playerClasses: playerClasses),
                        ));
                  }
                },
                type: 1),
          ),
        ],
      ),
    );
  }

  void removePlayer(Player player) {
    playerClasses.remove(player);
  }

  void addPlayer(Player player) {
    playerClasses.add(player);
  }
}
