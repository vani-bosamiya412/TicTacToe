import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/services/history_service.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final historyService = HistoryService();
  await historyService.load();

  runApp(
    ChangeNotifierProvider(
      create: (_) => historyService,
      child: TicTacToeApp(),
    ),
  );
}