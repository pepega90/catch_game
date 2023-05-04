import 'dart:async';
import 'dart:ui';

import 'package:first_game/constant.dart';
import 'package:first_game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Kotak extends SpriteComponent
    with HasGameRef<CatchGame>, CollisionCallbacks {
  JoystickComponent joystick;
  double _speed = 500;

  int life = 3;

  Kotak({required this.joystick});

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Global.kotakImage);
    position.x = gameRef.size.x / 2;
    position.y = gameRef.size.y - 100;
    anchor = Anchor.center;
    width = 100;
    height = 50;
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += joystick.relativeDelta * _speed * dt;
  }
}
