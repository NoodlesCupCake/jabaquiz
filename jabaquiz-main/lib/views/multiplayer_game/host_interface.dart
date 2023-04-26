import 'package:flutter/material.dart';
import 'package:jabaquiz/models/game_status.dart';
import 'package:jabaquiz/models/multiplayer_game.dart';
import 'package:jabaquiz/navigation.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/theme.dart';
import 'package:jabaquiz/views/multiplayer_game/inside_game.dart';
import 'package:jabaquiz/widgets/app_button.dart';
import 'package:jabaquiz/widgets/players_in_game.dart';

class MultiplayerGameHostIntro extends StatelessWidget {
  final MultiplayerGame game;

  const MultiplayerGameHostIntro({Key? key, required this.game})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'GAME CODE',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            game.code,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: bamYellow),
          ),
        ),
        PlayersInGame(gameId: game.id),
        const SizedBox(height: 24.0),
        AppButton(
          label: 'Start game',
          onPressed: () async {
            final gameService = Services.of(context).gameService;
            await gameService.updateGameStatus(game.id, GameStatus.started);
            final questions = await gameService.getQuestions(game.id);
            switchScreen(
                context, MultiplayerGameView(game: game, questions: questions));
          },
        ),
      ],
    );
  }
}
