import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_colors.dart';
import 'package:untitled/core/constants/app_icons.dart';
import '../../../navigation/bottom_nav.dart';

class GameActionButtons extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onNew;

  const GameActionButtons({
    super.key,
    required this.onReset,
    required this.onNew,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onReset,
            icon: Icon(
              AppIcons.refresh,
              color: AppColors.textPrimary,
              size: size.width * 0.05,
            ),
            label: Text(
              'Reset Game',
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: AppColors.textPrimary,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.016),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(width: size.width * 0.04),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomNav()),
              );
            },
            icon: Icon(Icons.add, color: AppColors.card, size: size.width * 0.05),
            label: Text(
              'New Game',
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: AppColors.card,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: size.height * 0.016),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }
}
