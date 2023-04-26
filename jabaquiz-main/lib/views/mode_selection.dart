import 'package:flutter/material.dart';
import 'package:jabaquiz/views/multiplayer_game/joining_room.dart';
import 'package:jabaquiz/views/multiplayer_game/game_setting.dart';
import 'package:jabaquiz/widgets/app_button.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'JABAQUIZ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        AppButton(
          label: 'Join game',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiplayerGameSearch(),
              ),
            );
          },
        ),
        AppButton(
          label: 'Host game',
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiplayerGameSettings(),
              ),
            );
          },
        ),
      ],
    );
  }
}
