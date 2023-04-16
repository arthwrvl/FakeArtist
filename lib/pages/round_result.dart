import 'package:fake_artist/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../classes/player.dart';
import '../widgets/player_card.dart';

class RoundResults extends StatefulWidget {
  final List<Player> playerClasses;

  const RoundResults({super.key, required this.playerClasses});

  @override
  State<RoundResults> createState() => _RoundResultsState();
}

class _RoundResultsState extends State<RoundResults> {
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
                  buttonText: "Artista Falso", onPressed: () {}, type: 1),
              const SizedBox(height: 20),
              CustomButton(buttonText: "Artistas", onPressed: () {}, type: 2),
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
              buttonText: "Próximo", onPressed: () {}, type: 1, disabled: true)
        ],
      ),
    );
  }
}
