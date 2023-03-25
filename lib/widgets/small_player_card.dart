import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SmallPlayerCard extends StatefulWidget {
  final double size;
  final Color bgColor;
  final String title;
  //add image
  const SmallPlayerCard({
    super.key,
    required this.bgColor,
    required this.size,
    required this.title,
    int points = 0,
  });

  @override
  State<SmallPlayerCard> createState() => _SmallPlayerCardState();
}

class _SmallPlayerCardState extends State<SmallPlayerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size * 1.3,
      width: widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: const Color(0xFFE8F1D7),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
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
                color: widget.bgColor),
          ),
          Align(
            widthFactor: 1.8,
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

/*
class Polaroid extends StatelessWidget {
  const Polaroid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: const Color(0xFFE8F1D7),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
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
            height: 90,
            width: 90,
            color: const Color(0xFFFCACAC),
          ),
          const Align(
            widthFactor: 1.8,
            alignment: Alignment.centerLeft,
            child: Text(
              "NOME",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}*/
