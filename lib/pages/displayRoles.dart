import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/player_final_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../classes/player.dart';

class DisplayRoles extends StatefulWidget {
  final List<Player> players;
  final String title;
  const DisplayRoles({super.key, required this.players, required this.title});

  @override
  State<DisplayRoles> createState() => _DisplayRolesState();
}

class _DisplayRolesState extends State<DisplayRoles> {
  late int index = 0;
  late List<Player> currentPlayers = List.of(widget.players);

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
          ThemeController(title: widget.title),
          CustomButton(
              buttonText:
                  index < currentPlayers.length - 1 ? "Próximo" : "Finalizar",
              onPressed: () {
                setState(() {
                  if (index < currentPlayers.length - 1) {
                    index++;
                  } else {
                    Navigator.pop(context);
                  }
                });
              },
              type: 1),
        ],
      ),
    );
  }
}

class ThemeController extends StatefulWidget {
  final String title;
  //final String theme;
  const ThemeController({super.key, required this.title});

  @override
  State<ThemeController> createState() => _ThemeControllerState();
}

class _ThemeControllerState extends State<ThemeController> {
  late bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: toggle
          ? GestureDetector(
              child: Container(
                  width: 240,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF6D887),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(widget.title,
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
                });
              },
              type: 2),
    );
  }
}
