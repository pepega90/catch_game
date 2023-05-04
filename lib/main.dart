import 'package:first_game/game.dart';
import 'package:first_game/screens/game_over.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final CatchGame catchGame = CatchGame();

  runApp(
    MaterialApp(
        home: Scaffold(
      body: GameWidget(
        game: catchGame,
        overlayBuilderMap: {
          GameOverScreen.id: (BuildContext context, CatchGame gameRef) =>
              GameOverScreen(
                gameRef: gameRef,
              )
        },
      ),
    )),
  );
}
