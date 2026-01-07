import 'package:flutter/material.dart';
import 'game_cell.dart';

class GameBoard extends StatelessWidget {
  final List<String> board;
  final Function(int) onTap;

  const GameBoard({
    super.key,
    required this.board,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cellSize = (width - (width * 0.12) - 24) / 3;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(
        9,
            (i) => SizedBox(
          width: cellSize,
          height: cellSize,
          child: GameCell(
            value: board[i],
            onTap: () => onTap(i),
          ),
        ),
      ),
    );
  }
}