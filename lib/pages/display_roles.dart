import 'package:fake_artist/pages/round_result.dart';
import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/player_final_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../classes/player.dart';

class DisplayRoles extends StatefulWidget {
  final List<Player> players;
  final String title;
  final int points;
  const DisplayRoles(
      {super.key,
      required this.players,
      required this.title,
      required this.points});

  @override
  State<DisplayRoles> createState() => _DisplayRolesState();
}

class _DisplayRolesState extends State<DisplayRoles> {
  late int index = 0;
  late List<Player> currentPlayers = List.of(widget.players);
  late bool toggle = false;
  late bool canNext = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < currentPlayers.length; i++) {
      if (currentPlayers[i].role == Role.master) {
        currentPlayers.removeAt(i);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PlayerFinalCard(
              player: currentPlayers[index], canEdit: false, showPoints: true),
          buildThemeController(currentPlayers[index].role),
          CustomButton(
              disabled: !canNext,
              buttonText:
                  index < currentPlayers.length - 1 ? "Próximo" : "Finalizar",
              onPressed: () {
                setState(() {
                  if (canNext) {
                    if (index < currentPlayers.length - 1) {
                      toggle = false;
                      canNext = false;
                      index++;
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RoundResults(
                                  playerClasses: widget.players,
                                  points: widget.points)));
                    }
                  }
                });
              },
              type: 1),
        ],
      ),
    );
  }

  Widget buildThemeController(Role role) {
    return Container(
      child: toggle
          ? GestureDetector(
              onTap: () {
                setState(() {
                  toggle = false;
                });
              },
              child: Container(
                  width: 240,
                  decoration: BoxDecoration(
                      color: role == Role.artist
                          ? Color(0xFFF6D887)
                          : Color(0xFFFCACAC),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(role == Role.artist ? widget.title : "FALSO!",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  )),
            )
          : CustomButton(
              buttonText: "Revelar Tema",
              onPressed: () {
                setState(() {
                  toggle = true;
                  canNext = true;
                });
              },
              type: 2),
    );
  }
}
