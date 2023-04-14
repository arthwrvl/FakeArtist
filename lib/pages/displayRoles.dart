import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/player_final_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../classes/player.dart';

class DisplayRoles extends StatefulWidget {
  final List<Player> players;
  const DisplayRoles({super.key, required this.players});

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlayerFinalCard(
              player: currentPlayers[index], canEdit: false, showPoints: true),
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
