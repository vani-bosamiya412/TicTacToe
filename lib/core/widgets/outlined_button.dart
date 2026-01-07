import 'package:flutter/material.dart';

class OutlinedAppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const OutlinedAppButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onTap, child: Text(label));
  }
}