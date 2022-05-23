import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:collision_rpg/enemy.dart';
import 'package:collision_rpg/light.dart';
import 'package:collision_rpg/player.dart';
import 'package:collision_rpg/player_spritesheet.dart';
import 'package:flutter/material.dart';

import 'npc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      onReady: (BonfireGame bonfireGame) {
        bonfireGame.colorFilter?.animateTo(Colors.deepPurple.withOpacity(0.1),
            blendMode: BlendMode.colorDodge);
        TalkDialog.show(context, [
          Say(
            text: [
              const TextSpan(
                style: TextStyle(color: Colors.amber),
                text: 'Alex去哪裏了？我需要找到她。就這麽幾個房間，應該很容易就找到她。',
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
                style: TextStyle(color: Colors.amber),
                text: '光線很暗，先打開手電筒再說。',
              )
            ],
            person: SizedBox(
              width: 50,
              height: 50,
              child: BobSpriteSheet.idle.asWidget(),
            ),
          )
        ]);
      },
      cameraConfig: CameraConfig(moveOnlyMapArea: true),
      joystick: Joystick(
          keyboardConfig: KeyboardConfig(),
          directional: JoystickDirectional(),
          actions: [
            JoystickAction(
              actionId: 1,
              margin: const EdgeInsets.all(50),
            ),
          ]),
      map: TiledWorldMap('tiled/level.json', objectsBuilder: {
        'spawn': (properties) => Alex(properties.position),
        'enemy1': (properties) => GreenEnemy(properties.position)..size = Vector2.zero(),
        'lamp': (properties) => Lamp(
            properties.position,
            Vector2(32, 0) * Random().nextInt(5).toDouble(),
            Vector2(32, 32),
            Color(Random().nextInt(pow(2, 31) as int)).withOpacity(0.2))
          ..size = Vector2(16, 16),
      }),
      lightingColorGame: Colors.black.withOpacity(0.9),
      player: Bob(Vector2(16, 23))..size = Vector2(32, 46),
    );
  }
}
