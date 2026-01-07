import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/navigation/bottom_nav.dart';
import '../../core/constants/app_colors.dart';
import '../../services/history_service.dart';
import 'widgets/history_card.dart';
import '../dialogs/delete_history_dialog.dart';
import '../dialogs/clear_all_dialog.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final history = context.watch<HistoryService>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          },
        ),
        centerTitle: false,
        title: Text(
          'Game History',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          if (history.items.isNotEmpty)
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => ClearAllDialog(
                    onConfirm: history.clear,
                  ),
                );
              },
              child: Text(
                'Clear All',
                style: TextStyle(color: AppColors.clearBg),
              ),
            ),
        ],
      ),
      body: history.items.isEmpty
          ? Center(child: Text('No game history yet'))
          : ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.02,
        ),
        itemCount: history.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.018),
            child: HistoryCard(
              item: history.items[index],
              onDelete: () {
                showDialog(
                  context: context,
                  builder: (_) => DeleteHistoryDialog(
                    onConfirm: () => history.delete(index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}