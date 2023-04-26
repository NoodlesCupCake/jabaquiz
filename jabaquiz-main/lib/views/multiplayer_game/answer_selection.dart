import 'package:flutter/material.dart';
import 'package:jabaquiz/models/game_question.dart';
import 'package:jabaquiz/widgets/app_button.dart';

class MultiplayerGameAnswerSelection extends StatelessWidget {
  static const red = Color.fromRGBO(192, 45, 45, 1);

  final GameQuestion question;
  final Duration timeLimit;
  final Function(String) onAnswerSelected;
  final String? selected;

  const MultiplayerGameAnswerSelection({
    Key? key,
    required this.question,
    required this.timeLimit,
    required this.onAnswerSelected,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 72.0),
        TimeLimitIndicator(
          key: ValueKey(question.text),
          duration: timeLimit,
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            question.text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 12.0),
        ...question.shuffledAnswers.map(
          (answer) {
            return Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: selected == null
                        ? () {
                            onAnswerSelected(answer);
                          }
                        : null,
                    label: answer,
                    backgroundColor: getColor(answer),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }

  Color? getColor(String answer) {
    if (selected == null) {
      return null;
    }
    if (answer == question.correctAnswer) {
      return Color.fromRGBO(25, 152, 38, 1);
    }
    if (answer != selected) {
      return Colors.grey.shade700;
    }
    return red;
  }
}

class TimeLimitIndicator extends StatelessWidget {
  final Duration duration;

  const TimeLimitIndicator({Key? key, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 1, end: 100),
      duration: duration,
      builder: (context, value, _) {
        return LinearProgressIndicator(
          value: value / 100,
        );
      },
    );
  }
}
