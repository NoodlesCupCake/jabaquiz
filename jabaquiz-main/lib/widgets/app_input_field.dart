import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jabaquiz/theme.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final List<TextInputFormatter> inputFormatters;
  final String? helperText;

  factory AppInputField.number({
    Key? key,
    required TextEditingController controller,
  }) {
    return AppInputField(
      key: key,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      textDirection: TextDirection.ltr,
    );
  }

  const AppInputField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.inputFormatters = const [],
    this.textDirection,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        keyboardType: keyboardType,
        textDirection: textDirection,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          helperText: helperText ?? 'Please type your input here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            borderSide: BorderSide(
              color: bamYellow,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
