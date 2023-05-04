import 'package:first_game/bom.dart';
import 'package:first_game/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOverScreen extends StatelessWidget {
  static String id = "gameOver";
  final CatchGame gameRef;

  const GameOverScreen({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Game Over",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                gameRef.overlays.remove(id);
                gameRef.reset();
                gameRef.resumeEngine();
              },
              child: Text(
                "Restart",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}
