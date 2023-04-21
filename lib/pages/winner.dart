import 'package:fake_artist/widgets/player_final_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../classes/player.dart';

class Winner extends StatefulWidget {
  final Player winner;
  const Winner({super.key, required this.winner});

  @override
  State<Winner> createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBanner(),
          PlayerFinalCard(
              player: widget.winner, canEdit: false, showPoints: true)
        ],
      ),
    );
  }

  Widget buildBanner() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          offset: Offset(4, 4)),
                    ],
                    color: Color(0xFFFFADDE)),
              ),
              Text(
                "${widget.winner.name} Venceu!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
