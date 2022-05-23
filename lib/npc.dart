import 'package:bonfire/bonfire.dart';
import 'package:collision_rpg/enemy.dart';
import 'package:flutter/material.dart';

import 'player_spritesheet.dart';

class Alex extends SimpleEnemy with ObjectCollision {
  bool dialogFinished = false;

  Alex(Vector2 position)
      : super(
          animation: AlexSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2(16, 23) * 2,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2(16, 23) * 2),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Player) {
      TalkDialog.show(context, [
        Say(
          text: [
            const TextSpan(
              style: TextStyle(color: Colors.lightGreenAccent),
              text: 'Bob你終於找到我了，快帶我離開這裏，不然就晚了。',
            )
          ],
          person: SizedBox(
            width: 50,
            height: 50,
            child: AlexSpriteSheet.idle.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              style: TextStyle(color: Colors.amber),
              text: 'Alex別鬧了，什麼不走就晚了，你還好吧，我們回家吧。',
            )
          ],
          person: SizedBox(
            width: 50,
            height: 50,
            child: BobSpriteSheet.idle.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              style: TextStyle(color: Colors.lightGreenAccent),
              text: '現在不能回家，他們就在我們家門口守著，我們回去不就是自投羅網嗎？',
            )
          ],
          person: SizedBox(
            width: 50,
            height: 50,
            child: AlexSpriteSheet.idle.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              style: TextStyle(color: Colors.amber),
              text: '你說的他們是誰，你還好嗎？是不是著涼了？我們快回家，早點休息一下，明天一切都是好起來。',
            )
          ],
          person: SizedBox(
            width: 50,
            height: 50,
            child: BobSpriteSheet.idle.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              style: TextStyle(color: Colors.lightGreenAccent),
              text: '我不回去，我寧願待在這裏，也不會去，這裏比家裏安全多了。',
            )
          ],
          person: SizedBox(
            width: 50,
            height: 50,
            child: AlexSpriteSheet.idle.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              style: TextStyle(color: Colors.amber),
              text: '''\$#%^&#*@&^#**&^^\$&#&&#''',
            )
          ],
          person: SizedBox(
            width: 50,
            height: 50,
            child: BobSpriteSheet.idle.asWidget(),
          ),
        )
      ], onFinish: () {
        var greenEnemy = gameRef.enemies().reduce((value, element) =>
            value.position.x < element.position.x ? value : element);
        gameRef.camera.moveToPositionAnimated(greenEnemy.position, zoom: 1.5,
            finish: () {
          TalkDialog.show(context, [
            Say(
              text: [
                const TextSpan(
                  style: TextStyle(color: Colors.lightBlueAccent),
                  text: '30分鐘之內，必須找到那個女孩，不然的話，一切都晚了。快，快，快！',
                )
              ],
              person: SizedBox(
                width: 50,
                height: 50,
                child: GreenEnemySpriteSheet.idle.asWidget(),
              ),
            ),
          ], onFinish: () {
            gameRef.camera.moveToPlayerAnimated(
                duration: const Duration(seconds: 2), zoom: 1);
          });
        });
      });

      gameRef.enemies().forEach((element) {
        if (element is GreenEnemy) {
          element.size = Vector2(50, 50);
          element.lightingEnabled = true;
        }
      });
    }
    return super.onCollision(component, active);
  }

  @override
  void update(double dt) {
    seePlayer(
      radiusVision: 200,
      observed: (player) {
        if (!dialogFinished) {
          dialogFinished = true;
          TalkDialog.show(context, [
            Say(
              text: [
                const TextSpan(
                  style: TextStyle(color: Colors.lightGreenAccent),
                  text: 'Bob是你嗎？我好害怕呀？我在這裏，你快來呀。',
                )
              ],
              person: SizedBox(
                width: 50,
                height: 50,
                child: AlexSpriteSheet.idle.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  style: TextStyle(color: Colors.lightGreenAccent),
                  text: '我好像被人跟蹤，這些人的來路不明。',
                )
              ],
              person: SizedBox(
                width: 50,
                height: 50,
                child: AlexSpriteSheet.idle.asWidget(),
              ),
            )
          ]);
        }
      },
    );
    super.update(dt);
  }
}
