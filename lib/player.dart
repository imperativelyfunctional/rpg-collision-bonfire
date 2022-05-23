import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'player_spritesheet.dart';

class Bob extends SimplePlayer with Lighting, ObjectCollision {
  static const double maxSpeed = 32 * 10;

  Bob(Vector2 position)
      : super(
          animation: BobSpriteSheet.simpleDirectionAnimation,
          size: Vector2(16, 23),
          position: position,
          speed: maxSpeed,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2(16, 23) * 2),
        ],
      ),
    );
    setupLighting(
      LightingConfig(
        radius: width * 5,
        blurBorder: width * 1.5,
        color: Colors.transparent,
        withPulse: true,
      ),
    );
    lightingEnabled = false;
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    speed = maxSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.id == 1 && event.event == ActionEvent.DOWN) {
      lightingEnabled = !lightingEnabled;
    }
    super.joystickAction(event);
  }
}
