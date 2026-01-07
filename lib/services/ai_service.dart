class AIService {
  static const String aiPlayer = 'O';
  static const String humanPlayer = 'X';

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

  int getBestMove(List<String> board) {
    int bestScore = -1000;
    int bestMove = -1;

    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        board[i] = aiPlayer;
        int score = _minimax(board, 0, false);
        board[i] = '';

        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    return bestMove;
  }

  int _minimax(List<String> board, int depth, bool isMaximizing) {
    String? result = _checkWinner(board);
    if (result != null) {
      if (result == aiPlayer) return 10 - depth;
      if (result == humanPlayer) return depth - 10;
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i].isEmpty) {
          board[i] = aiPlayer;
          bestScore = _max(
            bestScore,
            _minimax(board, depth + 1, false),
          );
          board[i] = '';
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i].isEmpty) {
          board[i] = humanPlayer;
          bestScore = _min(
            bestScore,
            _minimax(board, depth + 1, true),
          );
          board[i] = '';
        }
      }
      return bestScore;
    }
  }

  String? _checkWinner(List<String> board) {
    for (final pattern in _winPatterns) {
      final a = board[pattern[0]];
      final b = board[pattern[1]];
      final c = board[pattern[2]];

      if (a.isNotEmpty && a == b && b == c) {
        return a;
      }
    }

    if (!board.contains('')) {
      return 'Draw';
    }

    return null;
  }

  int _max(int a, int b) => a > b ? a : b;
  int _min(int a, int b) => a < b ? a : b;
}