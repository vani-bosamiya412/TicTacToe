import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_colors.dart';
import 'package:untitled/core/constants/app_icons.dart';

class ClearAllDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ClearAllDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.035,
        ),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size.width * 0.14,
              height: size.width * 0.14,
              decoration: BoxDecoration(
                color: AppColors.clearIconBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                AppIcons.error,
                color: AppColors.clearBg,
                size: size.width * 0.08,
              ),
            ),

            SizedBox(height: size.height * 0.02),

            Text(
              'Clear All History?',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: size.height * 0.012),

            Text(
              'This will delete all game history. This action cannot be undone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.016,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: size.width * 0.04),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.clearBg,
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.016,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: AppColors.card,
                        fontSize: size.width * 0.04,
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
