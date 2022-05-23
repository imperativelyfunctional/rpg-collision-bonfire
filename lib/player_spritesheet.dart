import 'package:bonfire/bonfire.dart';

class BobSpriteSheet {
  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "tiled/run.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 23),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "tiled/run.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 23),
          texturePosition: Vector2(12 * 16, 0),
        ),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "tiled/run.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 23),
          texturePosition: Vector2(6 * 16, 0),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "tiled/run.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 23),
          texturePosition: Vector2(18 * 16, 0),
        ),
      );

  static Future<SpriteAnimation> get idle => SpriteAnimation.load(
        "tiled/idle.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.4,
          textureSize: Vector2(16, 22),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        runRight: runRight,
        runLeft: runLeft,
        runDown: runDown,
        runUp: runUp,
        idleRight: idle,
      );
}

class AlexSpriteSheet {
  static Future<SpriteAnimation> get idle => SpriteAnimation.load(
        "tiled/alex.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.4,
          textureSize: Vector2(16, 22),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "tiled/alex.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.4,
          textureSize: Vector2(16, 22),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idle,
        runRight: runRight,
      );
}

class GreenEnemySpriteSheet {
  static Future<SpriteAnimation> get idle => SpriteAnimation.load(
        "tiled/enemy1.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(50, 50),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "tiled/enemy1.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(50, 50),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idle,
        runRight: runRight,
      );
}
