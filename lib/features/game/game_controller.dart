class GameController {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  bool gameOver = false;

  static const List<List<int>> _winPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  String? checkGameResult() {
    for (final pattern in _winPatterns) {
      final a = board[pattern[0]];
      final b = board[pattern[1]];
      final c = board[pattern[2]];

      if (a.isNotEmpty && a == b && b == c) {
        gameOver = true;
        return a;
      }
    }

    if (!board.contains('')) {
      gameOver = true;
      return 'Draw';
    }

    return null;
  }

  void reset() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    gameOver = false;
  }
}
