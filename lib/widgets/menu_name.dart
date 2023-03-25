import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MenuName extends StatefulWidget {
  const MenuName({super.key});

  @override
  State<MenuName> createState() => _MenuNameState();
}

class _MenuNameState extends State<MenuName> {
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
        const PolaroidMenu()
      ],
    );
  }
}

class PolaroidMenu extends StatefulWidget {
  const PolaroidMenu({super.key});

  @override
  State<PolaroidMenu> createState() => _PolaroidMenuState();
}

class _PolaroidMenuState extends State<PolaroidMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      height: size.width * 0.6 * 1.4,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 6),
          color: const Color(0xFFE8F1D7),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(5, 5))
          ]),
      child: Column(children: [
        SizedBox(height: size.width * 0.6 * .04),
        Stack(
          children: [
            Container(
              width: size.width * 0.6 * 0.87,
              height: size.width * 0.6 * 0.87,
              color: const Color(0xFF95F0C5),
            ),
            //Image
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.6 * 0.04),
            child: const Text(
              "FAKE\nARTIST",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
