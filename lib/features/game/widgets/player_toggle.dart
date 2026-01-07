import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_colors.dart';

class PlayerToggle extends StatelessWidget {
  final String current;
  final bool isAI;

  const PlayerToggle({
    super.key,
    required this.current,
    required this.isAI,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget buildTab({
      required bool selected,
      required IconData icon,
      required String label,
    }) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.014,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: size.width * 0.05,
                color: AppColors.textPrimary,
              ),
              SizedBox(width: size.width * 0.02),
              Text(
                label,
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          buildTab(
            selected: current == 'X',
            icon: Icons.close,
            label: 'Player X',
          ),
          buildTab(
            selected: current == 'O',
            icon: Icons.circle_outlined,
            label: isAI ? 'AI' : 'Player O',
          ),
        ],
      ),
    );
  }
}
