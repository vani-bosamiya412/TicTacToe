import 'package:flutter/material.dart';
import 'package:untitled/navigation/bottom_nav.dart';
import 'theme.dart';
import 'routes.dart';

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: BottomNav(),
      routes: AppRoutes.routes,
    );
  }
}