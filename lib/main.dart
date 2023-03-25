import 'package:fake_artist/widgets/button.dart';
import 'package:fake_artist/widgets/menu_name.dart';
import 'package:fake_artist/widgets/small_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Artist',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFF4),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

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
            Text(
              "Arthur Valério 2023",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ));
  }
}
