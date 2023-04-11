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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Resumo da Partida"),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text("Jogadores: ${widget.playerClasses.length}",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            PlayersResume(playerClasses: widget.playerClasses),
          ],
        ));
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