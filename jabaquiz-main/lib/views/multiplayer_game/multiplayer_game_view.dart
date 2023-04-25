import 'package:flutter/material.dart';
import 'package:jabaquiz/models/game_question.dart';
import 'package:jabaquiz/models/game_status.dart';
import 'package:jabaquiz/models/multiplayer_game.dart';
import 'package:jabaquiz/navigation.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/views/multiplayer_game/multiplayer_game_answer_selection.dart';
import 'package:jabaquiz/views/multiplayer_game/multiplayer_game_scoreboard.dart';
import 'package:jabaquiz/widgets/screen_loader.dart';

class MultiplayerGameManager {
  final Iterator<GameQuestion> _iterator;

  MultiplayerGameManager(List<GameQuestion> questions)
      : _iterator = questions.iterator;

  GameQuestion? get nextQuestion {
    final hasNext = _iterator.moveNext();
    if (hasNext) {
      return _iterator.current;
    }
    return null;
  }
}

class MultiplayerGameView extends StatefulWidget {
  final MultiplayerGame game;
  final MultiplayerGameManager manager;

  MultiplayerGameView({
    Key? key,
    required this.game,
    required List<GameQuestion> questions,
  })  : manager = MultiplayerGameManager(questions),
        super(key: key);

  @override
  State<MultiplayerGameView> createState() => _MultiplayerGameViewState();
}

class _MultiplayerGameViewState extends State<MultiplayerGameView> {
  GameQuestion? question;
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    question = question ?? widget.manager.nextQuestion!;
    return MultiplayerGameAnswerSelection(
      question: question!,
      timeLimit: widget.game.timePerQuestion,
      selected: selectedAnswer,
      onAnswerSelected: (answer) async {
        if (selectedAnswer != null) {
          return;
        }
        setState(() {
          selectedAnswer = answer;
        });
        // log('Answered "$answer"');
        await Services.of(context)
            .gameService
            .answerQuestion(widget.game.id, question!.id, answer);
      },
    );
  }

  @override
  void initState() {
    Future.delayed(widget.game.timePerQuestion).then((value) => next());
    super.initState();
  }

  Future<void> next() async {
    final nextQuestion = widget.manager.nextQuestion;
    if (nextQuestion != null) {
      setState(() {
        question = nextQuestion;
        selectedAnswer = null;
      });
      Future.delayed(widget.game.timePerQuestion).then((value) => next());
    } else {
      switchScreen(
        context,
        ScreenLoader(
          loadingText: 'The winner is...',
          future: Services.of(context).gameService.getScores(widget.game.id),
          builder: (context, scores) => MultiplayerGameScoreboard(
            scores: scores,
            userId: Services.of(context).authService.userId,
            game: widget.game,
          ),
        ),
      );
    }
  }
}
