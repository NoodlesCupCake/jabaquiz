import 'package:flutter/material.dart';
import 'package:jabaquiz/dependencies.dart';
import 'package:jabaquiz/services.dart';
import 'package:jabaquiz/theme.dart';
import 'package:jabaquiz/views/nickname_selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = await Dependencies.init;
  runApp(JabaquizApp(dependencies: dependencies));
}

class JabaquizApp extends StatelessWidget {
  final Dependencies dependencies;

  const JabaquizApp({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return Services(
      dependencies: dependencies,
      child: MaterialApp(
        title: 'Jabaquiz',
        theme: theme,
        home: IntroScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
