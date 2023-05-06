import 'package:fake_artist/data/PlayersDatabase.dart';
import 'package:flutter/material.dart';
import 'package:fake_artist/styles/colors.dart';
import 'package:fake_artist/styles/drawings.dart';

enum Role { master, fake, artist }

class Player {
  String name;
  int points = 0;
  Color background;
  String icon;
  Role role = Role.artist;

  Player(this.name, this.background, this.icon);

  void setRole(Role role) {
    this.role = role;
  }

  void setName(String name) {
    this.name = name;
  }

  void win() {
    if (role == Role.artist) {
      points += 1;
    } else if (role == Role.fake) {
      points += 2;
    } else if (role == Role.master) {
      points += 2;
    }
  }

  void cancelWin() {
    if (role == Role.artist) {
      points -= 1;
    } else if (role == Role.fake) {
      points -= 2;
    } else if (role == Role.master) {
      points -= 2;
    }
  }

  static Player fromJson(Map<String, Object?> json) => Player(
        json[PlayerFields.name] as String,
        Color(json[PlayerFields.color] as int),
        json[PlayerFields.icon] as String,
      );
}
