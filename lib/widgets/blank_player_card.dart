import 'package:flutter/material.dart';

class BlankCard extends StatefulWidget {
  final VoidCallback onTap;
  const BlankCard({super.key, required this.onTap});

  @override
  State<BlankCard> createState() => _BlankCardState();
}

class _BlankCardState extends State<BlankCard> {
  bool _pressing = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
      onTapUp: (details) => {
        setState(
          () {
            _pressing = false;
          },
        )
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 75),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: Colors.white,
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
              height: size.width * 0.3 * .85,
              width: size.width * 0.3 * .85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.white),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
