import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'player_spritesheet.dart';

class GreenEnemy extends SimpleEnemy with Lighting {
  final colors = [
    Colors.purpleAccent,
    Colors.purpleAccent,
    Colors.amberAccent,
    Colors.lightGreenAccent,
    Colors.indigoAccent,
    Colors.redAccent,
    Colors.deepOrangeAccent
  ];

  GreenEnemy(Vector2 position)
      : super(
          animation: GreenEnemySpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2(50, 50),
        ) {
    lightingEnabled = false;
    setupLighting(LightingConfig(
        radius: width * 1, blurBorder: width * 0.2, color: Colors.transparent));
  }
}
