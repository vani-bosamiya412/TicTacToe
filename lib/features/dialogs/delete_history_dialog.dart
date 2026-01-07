import 'package:flutter/material.dart';

class DeleteHistoryDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  const DeleteHistoryDialog({super.key, required this.onConfirm});

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size.width * 0.14,
              height: size.width * 0.14,
              decoration: BoxDecoration(
                color: Color(0xFFFFE6CC),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                color: Color(0xFFFF8A00),
                size: size.width * 0.08,
              ),
            ),

            SizedBox(height: size.height * 0.02),

            Text(
              'Delete Game History?',
              style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: size.height * 0.012),

            Text(
              'Are you sure you want to delete this game record?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: size.width * 0.04, color: Colors.black54),
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
                      style: TextStyle(color: Colors.black87, fontSize: size.width * 0.04),
                    ),
                  ),
                ),

                SizedBox(width: size.width * 0.04),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF8A00),
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
                      style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
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