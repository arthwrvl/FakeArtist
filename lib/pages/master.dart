import 'dart:math';

import 'package:fake_artist/classes/player.dart';
import 'package:fake_artist/widgets/player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MasterManagement extends StatefulWidget {
  final List<Player> players;
  final int maxPoints;
  const MasterManagement(
      {super.key, required this.players, required this.maxPoints});

  @override
  State<MasterManagement> createState() => _MasterManagementState();
}

class _MasterManagementState extends State<MasterManagement> {
  late List<Player> excludeMasters = List.of(widget.players);
  late Player currentMaster;

  @override
  void initState() {
    super.initState();
    sortRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PlayerCard(
              player: currentMaster,
              size: 200,
              showPoints: true,
              onDoubleTap: () {},
              onTap: () {
                setState(() {
                  sortRoles();
                });
              }),
        ],
      ),
    );
  }

  void sortRoles() {
    resetRoles();
    var random = Random.secure();
    List<int> avaliableIndex =
        List.generate(widget.players.length, (index) => index, growable: true);
    int randM = random.nextInt(excludeMasters.length);
    widget.players[widget.players.indexOf(excludeMasters[randM])]
        .setRole(Role.master);
    currentMaster =
        widget.players[widget.players.indexOf(excludeMasters[randM])];
    excludeMasters.removeAt(randM);
    avaliableIndex.remove(widget.players.indexOf(currentMaster));
    int randF = random.nextInt(avaliableIndex.length);
    widget.players[avaliableIndex[randF]].setRole(Role.fake);
  }

  void resetRoles() {
    for (int i = 0; i < widget.players.length; i++) {
      widget.players[i].setRole(Role.artist);
    }
  }

  String playerNames(List<Player> players) {
    String names = "";
    for (int i = 0; i < players.length; i++) {
      names += "${players[i].name} | ";
    }
    return names;
  }

  String playerRoles(List<Player> players) {
    String roles = "";
    for (int i = 0; i < players.length; i++) {
      roles += "${players[i].role} | ";
    }
    return roles;
  }
}
