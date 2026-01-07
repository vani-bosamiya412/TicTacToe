import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_colors.dart';
import 'package:untitled/core/constants/app_icons.dart';
import '../models/history_item.dart';

class HistoryCard extends StatelessWidget {
  final HistoryItem item;
  final VoidCallback onDelete;

  const HistoryCard({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.018,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: size.width * 0.09,
            height: size.width * 0.09,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.isAI ? AppIcons.ai : AppIcons.player,
              color: AppColors.primary,
              size: size.width * 0.05,
            ),
          ),

          SizedBox(width: size.width * 0.04),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.mode,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  item.time,
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Row(
                  children: [
                    Icon(
                      AppIcons.trophy,
                      size: size.width * 0.04,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: size.width * 0.02),
                    Text(
                      item.result,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          IconButton(
            icon: Icon(
              AppIcons.delete,
              size: size.width * 0.06,
              color: Colors.grey,
            ),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}