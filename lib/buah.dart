import 'dart:async';
import 'dart:math';

import 'package:first_game/constant.dart';
import 'package:first_game/game.dart';
import 'package:first_game/kotak.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Buah extends SpriteComponent
    with HasGameRef<CatchGame>, CollisionCallbacks {
  final _speed = 200;

  final Random random = Random();
  bool spawn = true;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    Sprite apple = await gameRef.loadSprite(Global.appleImage);
    Sprite cherry = await gameRef.loadSprite(Global.cherryImage);
    Sprite pear = await gameRef.loadSprite(Global.pearImage);
    List<Sprite> listImage = [apple, cherry, pear];
    sprite = listImage[random.nextInt(3)];
    width = 50;
    height = 50;
    position.x = random.nextInt(gameRef.size.x.toInt()).toDouble();
    position.y = -5;
    anchor = Anchor.center;
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (position.y > gameRef.size[1] && spawn) {
      gameRef.add(Buah());
      spawn = false;
    }

    position.y += _speed * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Kotak) {
      removeFromParent();
      gameRef.add(Buah());
      spawn = false;
      gameRef.score += 10;
    }
    super.onCollision(intersectionPoints, other);
  }
}
