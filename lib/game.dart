import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:first_game/bom.dart';
import 'package:first_game/buah.dart';
import 'package:first_game/constant.dart';
import 'package:first_game/joystick.dart';
import 'package:first_game/kotak.dart';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flame/palette.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'screens/game_over.dart';

class CatchGame extends FlameGame with HasDraggables, HasCollisionDetection {
  int score = 0;

  late Timer timer;

  int countDown = 30;

  late TextComponent scoreText;
  late TextComponent timerText;

  SpriteComponent bg = SpriteComponent();
  Bom bomb = Bom();
  Kotak k = Kotak(joystick: joystick);

  bool gameOver = false;
  final Random random = Random();

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    bg
      ..sprite = await loadSprite(Global.bg)
      ..size = size;

    add(bg);

    add(Buah());
    add(k);
    add(joystick);
    add(bomb);

    scoreText = TextComponent(
      text: "Score: $score",
      position: Vector2(20, 50),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.black.color,
          fontSize: 30,
        ),
      ),
    );

    add(scoreText);
  }

  @override
  void update(double dt) {
    super.update(dt);

    scoreText.text = "Score: $score";

    if (gameOver) {
      pauseEngine();
      overlays.add(GameOverScreen.id);
    }
  }

  void reset() {
    // bomb.removeFromParent();
    add(Bom());
    k
      ..position.x = size.x / 2
      ..position.y = size.y - 100;
    gameOver = false;
    score = 0;
  }
}
