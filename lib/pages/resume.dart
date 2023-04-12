import 'dart:math';

import 'package:fake_artist/pages/master.dart';
import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../classes/player.dart';
import '../widgets/player_card.dart';

class Resume extends StatefulWidget {
  final List<Player> playerClasses;

  const Resume({super.key, required this.playerClasses});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  late TextEditingController _controller;
  late int maxValue = 5;

  @override
  void initState() {
    _controller = TextEditingController(text: "5");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Resumo da Partida"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text("Jogadores: ${widget.playerClasses.length}",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  PlayersResume(playerClasses: widget.playerClasses),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("Pontuação Máxima",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CustomTextField(
                        controller: _controller,
                        type: 2,
                        onEdit: () {
                          setState(() {
                            maxValue = int.parse(_controller.text);
                          });
                        }),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        buttonText: "Iniciar Partida",
                        onPressed: callMaster,
                        type: 1),
                    SizedBox(
                      height: size.height / 10,
                    )
                  ],
                )),
          ],
        ));
  }

  void callMaster() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MasterManagement(
                  players: widget.playerClasses,
                  maxPoints: maxValue,
                )));
  }
}

class PlayersResume extends StatefulWidget {
  final List<Player> playerClasses;
  const PlayersResume({super.key, required this.playerClasses});

  @override
  State<PlayersResume> createState() => _PlayersResumeState();
}

class _PlayersResumeState extends State<PlayersResume> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: (size.width * 0.3 * 1.3) + 24,
      child: ListView.separated(
          padding: const EdgeInsets.all(12),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => PlayerCard(
              player: widget.playerClasses[index],
              size: size.width * 0.3,
              showPoints: false,
              onDoubleTap: () {},
              onTap: () {}),
          separatorBuilder: (context, _) => const SizedBox(width: 12),
          itemCount: widget.playerClasses.length),
    );
  }
}
/*
SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.playerClasses
            .map(
              (Player player) => PlayerCard(
                key: ValueKey(widget.playerClasses.indexOf(player)),
                player: player,
                size: size.width * 0.3,
                showPoints: false,
                onTap: () {},
                onDoubleTap: () {},
              ),
            )
            .toList(),
      ),
    );
    */