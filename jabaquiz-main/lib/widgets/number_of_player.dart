import 'package:flutter/material.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/widgets/heading.dart';

class NumberOfPlayersInGame extends StatelessWidget {
  final int gameId;

  const NumberOfPlayersInGame({Key? key, required this.gameId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream:
          Services.of(context).gameService.getCurrentNumberOfPlayers(gameId),
      initialData: 0,
      builder: (context, snapshot) {
        final number_of_players = snapshot.data ?? 0;
        return Heading(
          text: number_of_players.toString() + '/2',
        );
      },
    );
  }
}
