import 'dart:math';

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final int type;

  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.type});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _pressing = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _pressing = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _pressing = false;
        });
      },
      onTap: widget.onPressed,
      onTapUp: (details) {
        setState(() {
          _pressing = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 75),
        curve: Curves.bounceInOut,
        height: 50,
        width: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: widget.type == 1
                ? _pressing
                    ? const Color(0xFF88D4EE)
                    : const Color(0xFFA3E8FF)
                : _pressing
                    ? const Color(0xFFE8CA7C)
                    : const Color(0xFFF6D887),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: _pressing ? const Offset(0, 0) : const Offset(4, 4),
                blurRadius: 0,
              )
            ],
            border: Border.all(color: Colors.black, width: 3)),
        child: Center(
          child: Text(widget.buttonText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

/*
class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final int type;

  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: type == 1 ? const Color(0xFFA3E8FF) : const Color(0xFFF6D887),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 0,
            )
          ],
          border: Border.all(color: Colors.black, width: 2)),
      child: Center(
        child: GestureDetector(
          onTap: onPressed,
          child: Text(buttonText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
*/