import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Lamp extends GameDecoration with Lighting {
  Lamp(Vector2 position, Vector2 srcPosition, Vector2 srcSize, Color color)
      : super.withSprite(
          sprite: Sprite.load('tiled/lamps.png',
              srcPosition: srcPosition, srcSize: srcSize,),
          size: Vector2.all(32),
          position: position,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 1,
        blurBorder: width * 0.5,
        color: color,
      ),
    );
  }
}
