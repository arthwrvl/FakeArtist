import 'dart:math';

import 'package:fake_artist/classes/player.dart';
import 'package:fake_artist/widgets/player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MasterManagement extends StatefulWidget {
  final List<Player> players;
  const MasterManagement({super.key, required this.players});

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
          Text(playerNames(excludeMasters)),
          Text(playerNames(widget.players)),
          Text(playerRoles(widget.players)),
        ],
      ),
    );
  }

  void sortRoles() {
    resetRoles();
    List<int> avaliableIndex =
        List.generate(widget.players.length, (index) => index, growable: true);
    int randM = Random().nextInt(excludeMasters.length);
    widget.players[widget.players.indexOf(excludeMasters[randM])]
        .setRole(Role.master);
    currentMaster =
        widget.players[widget.players.indexOf(excludeMasters[randM])];
    excludeMasters.removeAt(randM);
    avaliableIndex.remove(widget.players.indexOf(currentMaster));
    int randF = Random().nextInt(avaliableIndex.length);
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
