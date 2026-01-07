import 'package:flutter/material.dart';
import '../../navigation/bottom_nav.dart';

class GameOverDialog extends StatelessWidget {
  final String winner;
  final VoidCallback onPlayAgain;

  const GameOverDialog({
    super.key,
    required this.winner,
    required this.onPlayAgain,
  });

  bool get isDraw => winner == 'Draw';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final Color primaryColor = Color(0xFF00A693);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.07,
          vertical: size.height * 0.04,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size.width * 0.16,
              height: size.width * 0.16,
              decoration: BoxDecoration(
                color: isDraw
                    ? Colors.grey.shade200
                    : primaryColor.withValues(alpha: 0.18),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDraw ? Icons.remove : Icons.emoji_events,
                color: isDraw ? Colors.grey : primaryColor,
                size: size.width * 0.07,
              ),
            ),

            SizedBox(height: size.height * 0.022),

            Text(
              'Game Over',
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: size.height * 0.008),

            Text(
              isDraw ? "It's a Draw!" : "Player $winner Wins!",
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w600,
                color: isDraw ? Colors.black87 : primaryColor,
              ),
            ),

            SizedBox(height: size.height * 0.006),

            Text(
              isDraw ? 'Good match! Try again?' : 'Great game!',
              style: TextStyle(
                fontSize: size.width * 0.038,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: size.height * 0.035),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNav()),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.017,
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Go to Home',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: size.width * 0.045),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onPlayAgain();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.017,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Play Again',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
