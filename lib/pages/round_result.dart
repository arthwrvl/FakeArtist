import 'package:fake_artist/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../classes/player.dart';
import '../widgets/player_card.dart';

class RoundResults extends StatefulWidget {
  final List<Player> playerClasses;
  final int points;
  const RoundResults(
      {super.key, required this.playerClasses, required this.points});

  @override
  State<RoundResults> createState() => _RoundResultsState();
}

class _RoundResultsState extends State<RoundResults> {
  late int winner = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Quem ganhou?",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              CustomButton(
                  buttonText: "Artista Falso",
                  onPressed: fakeWins,
                  type: 1,
                  disabled: winner == 1),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: "Artistas",
                onPressed: artistWins,
                type: 2,
                disabled: winner == 2,
              ),
            ],
          ),
          SizedBox(
            height: ((size.width * 0.3 * 1.3) + 18) * 2,
            width: size.width,
            child: GridView.count(
              physics: ScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7712418301,
              children: widget.playerClasses
                  .map(
                    (Player player) => PlayerCard(
                      key: ValueKey(widget.playerClasses.indexOf(player)),
                      player: player,
                      size: size.width * 0.3,
                      showPoints: true,
                      onTap: () {},
                      onDoubleTap: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
          CustomButton(
              buttonText: "Próximo",
              onPressed: finishRound,
              type: 1,
              disabled: winner == 0)
        ],
      ),
    );
  }

  void finishRound() {
    bool hasWinner = false;
    for (int i = 0; i < widget.playerClasses.length; i++) {
      if (widget.playerClasses[i].points >= widget.points) {
        //finish
        hasWinner = true;
      }
    }
    if (!hasWinner) {
      int counter = 0;
      Navigator.popUntil(context, (route) {
        return counter++ == 2;
      });
    }
  }

  void fakeWins() {
    if (winner != 0) {
      cancelWin();
    }
    winner = 1;
    for (int i = 0; i < widget.playerClasses.length; i++) {
      if (widget.playerClasses[i].role == Role.fake ||
          widget.playerClasses[i].role == Role.master) {
        setState(() {
          widget.playerClasses[i].win();
        });
      }
    }
  }

  void artistWins() {
    if (winner != 0) {
      cancelWin();
    }
    winner = 2;
    for (int i = 0; i < widget.playerClasses.length; i++) {
      if (widget.playerClasses[i].role == Role.artist) {
        setState(() {
          widget.playerClasses[i].win();
        });
      }
    }
  }

  void cancelWin() {
    for (int i = 0; i < widget.playerClasses.length; i++) {
      if (winner == 2) {
        if (widget.playerClasses[i].role == Role.artist) {
          widget.playerClasses[i].cancelWin();
        }
      }
      if (winner == 1) {
        if (widget.playerClasses[i].role == Role.fake ||
            widget.playerClasses[i].role == Role.master) {
          widget.playerClasses[i].cancelWin();
        }
      }
    }
  }
}
