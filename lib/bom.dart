import 'dart:async';
import 'dart:math';

import 'package:first_game/constant.dart';
import 'package:first_game/game.dart';
import 'package:first_game/kotak.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Bom extends SpriteComponent
    with HasGameRef<CatchGame>, CollisionCallbacks {
  final _speed = 200;
  bool spawn = true;
  final Random random = Random();

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Global.bomImage);
    width = 50;
    height = 80;
    position.x = random.nextInt(gameRef.size.x.toInt()).toDouble();
    position.y = -5;
    anchor = Anchor.center;
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (position.y > gameRef.size[1] && spawn) {
      gameRef.add(Bom());
      spawn = false;
    }

    position.y += _speed * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Kotak && !gameRef.gameOver) {
      removeFromParent();
      gameRef.gameOver = true;
    }
    super.onCollision(intersectionPoints, other);
  }
}
