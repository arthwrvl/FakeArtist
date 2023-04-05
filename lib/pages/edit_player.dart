import 'package:fake_artist/styles/drawings.dart';
import 'package:fake_artist/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../classes/player.dart';

class EditPlayer extends StatefulWidget {
  final Player player;
  const EditPlayer({super.key, required this.player});

  @override
  State<EditPlayer> createState() => _EditPlayerState();
}

class _EditPlayerState extends State<EditPlayer> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.player.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Editar Jogador"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: PlayerFinalCard(player: widget.player)),
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: TextField(
                      controller: _controller,
                      onChanged: (e) {
                        setState(
                          () {},
                        );
                      },
                    )),
                Flexible(
                    flex: 1,
                    child: CustomButton(
                        buttonText: "Salvar",
                        onPressed: () {
                          setState(() {
                            widget.player.name = _controller.text;
                          });
                        },
                        type: 1)),
              ],
            )),
      ),
    );
  }
}

class PlayerFinalCard extends StatefulWidget {
  final Player player;
  const PlayerFinalCard({super.key, required this.player});

  @override
  State<PlayerFinalCard> createState() => _PlayerFinalCardState();
}

class _PlayerFinalCardState extends State<PlayerFinalCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width * 0.8,
          height: size.width * 0.8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD6D6FF),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
                iconSize: 48),
            Container(
              width: size.width * 0.46,
              height: size.width * 0.46 * 1.4,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 6),
                  color: const Color(0xFFE8F1D7),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(5, 5))
                  ]),
              child: Column(children: [
                SizedBox(height: size.width * 0.46 * .04),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: size.width * 0.46 * 0.87,
                      height: size.width * 0.46 * 0.87,
                      color: widget.player.background,
                    ),
                    SvgPicture.asset(widget.player.icon,
                        width: size.width * 0.46 * 0.87),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.56 * 0.04),
                    child: Text(
                      widget.player.name,
                      style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ]),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                iconSize: 48),
          ],
        )
      ],
    );
  }
}
