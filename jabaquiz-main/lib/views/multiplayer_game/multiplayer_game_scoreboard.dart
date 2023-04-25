import 'package:flutter/material.dart';
import 'package:jabaquiz/models/game_status.dart';
import 'package:jabaquiz/models/multiplayer_game.dart';
import 'package:jabaquiz/models/player_score.dart';
import 'package:jabaquiz/navigation.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/theme.dart';
import 'package:jabaquiz/views/title_screen.dart';
import 'package:jabaquiz/widgets/app_button.dart';

class MultiplayerGameScoreboard extends StatelessWidget {
  final List<PlayerScore> scores;
  final String userId;
  final MultiplayerGame game;
  const MultiplayerGameScoreboard({
    Key? key,
    required this.scores,
    required this.userId,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentScore = -1;
    int rank = 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Text('Results', style: Theme.of(context).textTheme.headlineLarge),
        ),
        ...scores.map(
          (score) {
            final lineStyle =
                TextStyle(color: score.userId == userId ? bamYellow : null);
            if (score.score != currentScore) {
              currentScore = score.score;
              rank++;
            }
            return ListTile(
              title: Text(
                '$rank. ${score.nickname}',
                style: lineStyle,
              ),
              trailing: Text(score.score.toString(), style: lineStyle),
            );
          },
        ),
        Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Exit',
                onPressed: () async {
                  final gameService = Services.of(context).gameService;
                  await gameService.updateGameStatus(
                      game.id, GameStatus.complete);
                  // switchScreen(context, const TitleScreen());
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
