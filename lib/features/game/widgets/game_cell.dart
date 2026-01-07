import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_colors.dart';

class GameCell extends StatelessWidget {
  final String value;
  final VoidCallback onTap;

  const GameCell({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: size.width * 0.09,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
