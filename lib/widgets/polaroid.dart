import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
}
