import 'package:fake_artist/classes/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerCard extends StatefulWidget {
  final double size;
  final Player player;
  final bool showPoints;
  final VoidCallback onDoubleTap;
  final VoidCallback onTap;
  //add image
  const PlayerCard({
    super.key,
    required this.player,
    required this.size,
    required this.showPoints,
    required this.onDoubleTap,
    required this.onTap,
  });

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  bool _pressing = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => {
        setState(
          () {
            _pressing = true;
          },
        )
      },
      onTap: widget.onTap,
      onTapCancel: () => {
        setState(
          () {
            _pressing = false;
          },
        )
      },
      onDoubleTap: widget.onDoubleTap,
      onTapUp: (details) => {
        setState(
          () {
            _pressing = false;
          },
        )
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.size * 1.3,
        width: widget.size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: const Color(0xFFE8F1D7),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: _pressing ? const Offset(0, 0) : const Offset(4, 4),
              blurRadius: 0,
            )
          ],
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Container(
              height: widget.size * .85,
              width: widget.size * .85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: Colors.black, width: 2),
                  color: widget.player.background),
              child: SvgPicture.asset(widget.player.icon),
            ),
            Container(
              padding: EdgeInsets.only(left: widget.size * .07),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.player.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
