import 'package:flutter/material.dart';
import 'package:jabaquiz/navigation.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/services/game_service.dart';
import 'package:jabaquiz/views/multiplayer_game/player_interface.dart';
import 'package:jabaquiz/widgets/app_button.dart';
import 'package:jabaquiz/widgets/app_input_field.dart';
import 'package:jabaquiz/widgets/app_screen.dart';
import 'package:jabaquiz/widgets/heading.dart';

class MultiplayerGameSearch extends StatelessWidget {
  final _gameCodeController = TextEditingController();

  MultiplayerGameSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Heading(text: 'Enter game code'),
          AppInputField(
            controller: _gameCodeController,
            helperText: 'Please type the available game code here',
          ),
          const SizedBox(height: 8.0),
          AppButton(
            label: 'Join game',
            onPressed: () async {
              try {
                final gameService = Services.of(context).gameService;
                final game = await gameService
                    .joinMultiplayerGame(_gameCodeController.text);
                switchScreen(
                    context,
                    MultiplayerGamePlayerIntro(
                      game: game,
                      gameService: gameService,
                    ));
              } on InvalidGameCodeException catch (ex) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      ex.message.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
