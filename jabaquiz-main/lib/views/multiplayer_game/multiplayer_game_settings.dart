import 'package:flutter/material.dart';
import 'package:jabaquiz/navigation.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/views/multiplayer_game/multiplayer_game_host_intro.dart';
import 'package:jabaquiz/widgets/app_button.dart';
import 'package:jabaquiz/widgets/app_input_field.dart';
import 'package:jabaquiz/widgets/app_screen.dart';
import 'package:jabaquiz/widgets/heading.dart';
import 'package:jabaquiz/widgets/screen_loader.dart';

import '../../services/game_service.dart';

class MultiplayerGameSettings extends StatelessWidget {
  final numOfQuestionsController = TextEditingController(text: '5');
  final secondsPerQuestionController = TextEditingController(text: '5');

  MultiplayerGameSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Heading(text: 'Number of questions'),
          AppInputField.number(
            controller: numOfQuestionsController,
          ),
          const SizedBox(height: 8.0),
          Heading(text: 'Time per question'),
          AppInputField.number(
            controller: secondsPerQuestionController,
          ),
          const SizedBox(height: 8.0),
          AppButton.expanded(
            label: 'Create game',
            onPressed: () async {
              try {
                final numOfQuestions =
                    int.tryParse(numOfQuestionsController.text) ?? 5;
                final secondsToAnswer =
                    int.tryParse(secondsPerQuestionController.text) ?? 5;
                switchScreen(
                  context,
                  ScreenLoader(
                    future: Services.of(context)
                        .gameService
                        .newMultiplayerGame(numOfQuestions, secondsToAnswer),
                    builder: (context, game) =>
                        MultiplayerGameHostIntro(game: game),
                  ),
                );
              } on InvalidInputException catch (ex) {
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
