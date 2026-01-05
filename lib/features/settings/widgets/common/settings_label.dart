import 'package:flutter/material.dart';

class Settings_label extends StatelessWidget {
  final String text;

  const Settings_label(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
