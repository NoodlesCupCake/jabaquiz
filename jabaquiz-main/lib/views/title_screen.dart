import 'package:flutter/material.dart';
import 'package:jabaquiz/views/multiplayer_game/multiplayer_game_search.dart';
import 'package:jabaquiz/views/multiplayer_game/multiplayer_game_settings.dart';
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
        AppButton.expanded(
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
        AppButton.expanded(
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
