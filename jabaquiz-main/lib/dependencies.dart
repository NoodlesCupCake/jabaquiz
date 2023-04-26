import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:jabaquiz/services/trivia_service.dart';
import 'package:jabaquiz/services/auth_service.dart';
import 'package:jabaquiz/services/game_service.dart';

class Dependencies {
  final AuthService authService;
  final GameService gameService;

  Dependencies._(this.authService, this.gameService);

  static Future<Dependencies> get init async {
    final supabase = await Supabase.initialize(
      url: 'http://localhost:54321',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0',
    );
    final sharedPreferences = await SharedPreferences.getInstance();
    final authService = AuthService(supabase.client.auth, sharedPreferences);
    final gameService =
        GameService(authService, TriviaRepository(), supabase.client);
    return Dependencies._(authService, gameService);
  }
}
