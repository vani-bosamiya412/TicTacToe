import 'package:flutter/material.dart';
import '../features/game/game_screen.dart';

class AppRoutes {
  static const game = '/game';

  static Map<String, WidgetBuilder> routes = {
    game: (_) => GameScreen(isAI: false),
  };
}