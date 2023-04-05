import 'package:fake_artist/styles/drawings.dart';
import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/player_final_card.dart';
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
  late Player _player;
  @override
  void initState() {
    super.initState();
    _player = Player(
        widget.player.name, widget.player.background, widget.player.icon);
    _controller = TextEditingController(text: _player.name);
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
                    child: PlayerFinalCard(player: _player)),
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: TextField(
                      controller: _controller,
                      onChanged: (e) {
                        setState(
                          () {
                            _player.name = _controller.text;
                          },
                        );
                      },
                    )),
                Flexible(
                    flex: 1,
                    child: CustomButton(
                        buttonText: "Salvar",
                        onPressed: () {
                          setState(() {
                            widget.player.name = _player.name;
                            widget.player.icon = _player.icon;
                            widget.player.background = _player.background;
                          });
                          Navigator.pop(context);
                        },
                        type: 1)),
              ],
            )),
      ),
    );
  }
}
