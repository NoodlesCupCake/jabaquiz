import 'package:flutter/material.dart';
import 'package:jabaquiz/navigation.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/services/nickname_generator.dart';
import 'package:jabaquiz/views/mode_selection.dart';
import 'package:jabaquiz/widgets/app_button.dart';
import 'package:jabaquiz/widgets/app_input_field.dart';
import 'package:jabaquiz/widgets/app_screen.dart';
import 'package:jabaquiz/widgets/heading.dart';

class IntroScreen extends StatelessWidget {
  final _nicknameController =
      TextEditingController(text: NicknameGenerator.generate);

  IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Heading(text: 'Choose nickname'),
          AppInputField(
            controller: _nicknameController,
            helperText: 'Please type your nickname here',
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppButton(
              label: 'Play',
              onPressed: () async {
                await Services.of(context)
                    .authService
                    .signIn(_nicknameController.text);
                switchScreen(context, const TitleScreen());
              },
            ),
          ]),
        ],
      ),
    );
  }
}
