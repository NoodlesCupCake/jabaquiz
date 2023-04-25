import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const bamYellow = Color.fromRGBO(255, 199, 0, 1);

ThemeData get theme {
  final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: bamYellow,
      onBackground: Colors.black,
      brightness: Brightness.dark,
    ),
    useMaterial3: false,
  );
  return theme.copyWith(
    textTheme: GoogleFonts.oxygenMonoTextTheme(theme.textTheme),
    primaryTextTheme: GoogleFonts.oxygenMonoTextTheme(theme.primaryTextTheme),
  );
}
