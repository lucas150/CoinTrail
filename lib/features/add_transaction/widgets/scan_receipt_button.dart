import 'package:flutter/material.dart';
import 'action_field.dart';

class ScanReceiptField extends StatelessWidget {
  final String? receiptPath;
  final VoidCallback onTap;

  const ScanReceiptField({
    super.key,
    required this.receiptPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionField(
      label: 'Receipt',
      leading: const Icon(Icons.camera_alt),
      value: receiptPath == null ? 'Scan Receipt' : 'Receipt Added',
      onTap: onTap,
    );
  }
}
