import 'dart:math';

import 'package:fake_artist/classes/player.dart';
import 'package:fake_artist/pages/displayRoles.dart';
import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/player_card.dart';
import 'package:fake_artist/widgets/player_final_card.dart';
import 'package:fake_artist/widgets/textField.dart';
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
  late TextEditingController _wordController;
  late TextEditingController _themeController;
  @override
  void initState() {
    super.initState();
    _themeController = TextEditingController();
    _wordController = TextEditingController();
    sortRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text("O Artista Mestre é:",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              PlayerFinalCard(
                player: currentMaster,
                canEdit: false,
                showPoints: true,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextField(
                    controller: _wordController,
                    onEdit: () {},
                    type: 1,
                    placeholder: "Título da Rodada"),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: _themeController,
                    onEdit: () {},
                    type: 1,
                    placeholder: "Tema da Rodada"),
              ],
            ),
          ),
          CustomButton(buttonText: "Avançar", onPressed: finishSetup, type: 1)
        ],
      ),
    );
  }

  void finishSetup() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DisplayRoles(
                players: widget.players, title: _wordController.text)));
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
}
