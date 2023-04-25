import 'package:flutter/material.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/widgets/heading.dart';

import 'number_of_player.dart';

class PlayersInGame extends StatelessWidget {
  final int gameId;

  const PlayersInGame({Key? key, required this.gameId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: Services.of(context).gameService.getCurrentPlayers(gameId),
      initialData: const [],
      builder: (context, snapshot) {
        final players = snapshot.data ?? [];
        return Column(
          children: [
            const SizedBox(height: 12.0),
            Heading(text: 'Players'),
            NumberOfPlayersInGame(gameId: gameId),
            const SizedBox(height: 12.0),
            ...players.map((nickname) => Text(
                  nickname,
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            Text(
              '...?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        );
      },
    );
  }
}
