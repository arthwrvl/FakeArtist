import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/menu_name.dart';
import 'package:fake_artist/widgets/small_player_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuName(),
                Column(
                  children: [
                    CustomButton(
                      buttonText: "Iniciar Jogo",
                      onPressed: () {},
                      type: 1,
                    ),
                    SizedBox(height: size.height * .03),
                    CustomButton(
                      buttonText: "Regras",
                      onPressed: () {},
                      type: 2,
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "Arthur Valério 2023",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ));
  }
}
