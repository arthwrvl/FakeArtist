import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fake_artist/styles/drawings.dart';
import 'package:lottie/lottie.dart';

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

class _PolaroidMenuState extends State<PolaroidMenu>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  int rand = Random().nextInt(7);
  var drawings = [line1, line2, line3, line4, line5, line6, line7];
  bool loaded = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.56,
      height: size.width * 0.56 * 1.4,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 6),
          color: const Color(0xFFE8F1D7),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(5, 5))
          ]),
      child: Column(children: [
        SizedBox(height: size.width * 0.56 * .04),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size.width * 0.56 * 0.87,
              height: size.width * 0.56 * 0.87,
              color: const Color(0xFF95F0C5),
            ),
            Lottie.asset(drawings[rand], controller: _controller,
                onLoaded: (composition) {
              _controller.duration = composition.duration;
              Future.delayed(const Duration(milliseconds: 300), () {
                _controller.forward().whenComplete(() {
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      int nextrand = Random().nextInt(7);
                      if (nextrand == rand) {
                        if (nextrand != 6) {
                          rand = nextrand + 1;
                        } else {
                          rand = nextrand - 1;
                        }
                      } else {
                        rand = nextrand;
                      }
                      _controller.duration = composition.duration;
                      _controller.value = 0;
                    });
                  });
                });
              });
            })
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.56 * 0.04),
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
