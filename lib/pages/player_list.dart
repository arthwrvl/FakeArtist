import 'package:fake_artist/classes/player.dart';
import 'package:fake_artist/data/players.dart';
import 'package:fake_artist/styles/colors.dart';
import 'package:fake_artist/styles/drawings.dart';
import 'package:fake_artist/widgets/player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PlayerGrid extends StatefulWidget {
  const PlayerGrid({super.key});

  @override
  State<PlayerGrid> createState() => _PlayerGridState();
}

class _PlayerGridState extends State<PlayerGrid> {
  List<Player> playerClasses = List.empty(growable: true);
  bool start = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (start) {
      start = false;
      for (int i = 0; i < players.length; i++) {
        playerClasses.add(Player(players[i], colors[i], icons[i]));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogadores: ${playerClasses.length}"),
      ),
      body: Center(
        // use ReorderableGridView.count() when version >= 2.0.0
        // else use ReorderableGridView()
        child: ReorderableGridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          padding: const EdgeInsets.all(8),
          childAspectRatio: 0.7712418301,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              final element = playerClasses.removeAt(oldIndex);
              playerClasses.insert(newIndex, element);
            });
          },
          footer: [
            BlankCard(
              onTap: () {
                setState(() {
                  addPlayer(Player(
                      players[playerClasses.length],
                      colors[playerClasses.length],
                      icons[playerClasses.length]));
                });
              },
            )
          ],
          children: playerClasses
              .map(
                (Player player) => PlayerCard(
                  key: ValueKey(player.name),
                  player: player,
                  size: size.width * 0.3,
                  showPoints: false,
                  onDoubleTap: () {
                    setState(() {
                      removePlayer(player);
                    });
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void removePlayer(Player player) {
    playerClasses.remove(player);
  }

  void addPlayer(Player player) {
    playerClasses.add(player);
  }
}

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
