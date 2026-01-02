import 'package:cointrail/common/header/appHeader.dart' show AppHeader;
import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(title: 'Analysis', showBack: true, showNotification: true),

          const Expanded(
            child: Center(child: Text('Analysis Content Goes Here')),
          ),
        ],
      ),
    );
  }
}
