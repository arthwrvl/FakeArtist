import 'package:fake_artist/styles/colors.dart';
import 'package:fake_artist/styles/drawings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../classes/player.dart';

class PlayerFinalCard extends StatefulWidget {
  final Player player;
  const PlayerFinalCard({super.key, required this.player});

  @override
  State<PlayerFinalCard> createState() => _PlayerFinalCardState();
}

class _PlayerFinalCardState extends State<PlayerFinalCard> {
  int iconIndex = 0;
  int colorIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < icons.length; i++) {
      if (icons[i] == widget.player.icon) {
        iconIndex = i;
        break;
      }
    }
    for (int i = 0; i < colors.length; i++) {
      if (colors[i] == widget.player.background) {
        colorIndex = i;
        break;
      }
    }
  }

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
                onPressed: () {
                  setState(() {
                    if (iconIndex > 0) {
                      iconIndex--;
                    } else {
                      iconIndex = icons.length - 1;
                    }
                    widget.player.icon = icons[iconIndex];
                  });
                },
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (colorIndex < colors.length - 1) {
                        colorIndex++;
                      } else {
                        colorIndex = 0;
                      }
                      widget.player.background = colors[colorIndex];
                    });
                  },
                  child: Stack(
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
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.56 * 0.04),
                    child: Text(
                      widget.player.name,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ]),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (iconIndex < icons.length - 1) {
                      iconIndex++;
                    } else {
                      iconIndex = 0;
                    }
                    widget.player.icon = icons[iconIndex];
                  });
                },
                icon: const Icon(Icons.arrow_forward),
                iconSize: 48),
          ],
        )
      ],
    );
  }
}
