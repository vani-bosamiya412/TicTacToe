import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:untitled/core/constants/app_colors.dart';
import '../../services/ai_service.dart';
import 'game_controller.dart';
import 'widgets/game_board.dart';
import 'widgets/player_toggle.dart';
import 'widgets/game_action_buttons.dart';
import '../dialogs/game_over_dialog.dart';
import '../../services/history_service.dart';
import '../history/models/history_item.dart';

class GameScreen extends StatefulWidget {
  final bool isAI;

  const GameScreen({super.key, required this.isAI});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameController controller = GameController();
  final AIService aiService = AIService();

  void _handleGameEnd(String result) {
    final historyService = context.read<HistoryService>();

    historyService.add(
      HistoryItem(
        mode: widget.isAI ? 'Player vs AI' : 'Player vs Player',
        time: DateFormat('MMM d, hh:mm a').format(DateTime.now()),
        result: result == 'Draw' ? 'Draw' : 'Player $result Wins',
        isAI: widget.isAI,
      ),
    );

    Future.delayed(Duration(milliseconds: 200), () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => GameOverDialog(
          winner: result,
          onPlayAgain: () {
            setState(() {
              controller.reset();
            });
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: size.width * 0.05,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.02,
        ),
        child: Column(
          children: [
            PlayerToggle(current: controller.currentPlayer, isAI: widget.isAI),

            SizedBox(height: size.height * 0.1),

            Text(
              controller.gameOver
                  ? 'Game Over'
                  : "Player ${controller.currentPlayer}'s turn",
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: size.height * 0.04),

            Center(
              child: GameBoard(
                board: controller.board,
                onTap: (index) {
                  if (controller.gameOver || controller.board[index].isNotEmpty) {
                    return;
                  }

                  setState(() {
                    controller.board[index] = controller.currentPlayer;

                    final result = controller.checkGameResult();
                    if (result != null) {
                      _handleGameEnd(result);
                      return;
                    }

                    controller.currentPlayer = controller.currentPlayer == 'X'
                        ? 'O'
                        : 'X';
                  });

                  if (widget.isAI) {
                    Future.delayed(Duration(milliseconds: 300), () {
                      final aiMove = aiService.getBestMove(controller.board);

                      if (aiMove != -1) {
                        setState(() {
                          controller.board[aiMove] = 'O';

                          final aiResult = controller.checkGameResult();
                          if (aiResult != null) {
                            _handleGameEnd(aiResult);
                            return;
                          }

                          controller.currentPlayer = 'X';
                        });
                      }
                    });
                  }
                },
              ),
            ),

            SizedBox(height: size.height * 0.06),

            GameActionButtons(
              onReset: () {
                setState(() {
                  controller.reset();
                });
              },
              onNew: () {
                setState(() {
                  controller.reset();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}