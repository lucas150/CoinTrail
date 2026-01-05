import 'package:cointrail/features/add_transaction/pages/add_transaction_page.dart';
import 'package:cointrail/features/analysis/screen/analysis_page.dart';
import 'package:cointrail/features/settings/screen/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:cointrail/features/navbar/nav_bar.dart';
import 'package:cointrail/features/home/screens/home_page.dart';
import 'package:cointrail/features/search/screens/search_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _index = 0;

  final _pages = const [
    const HomePage(),
    AnalysisPage(),
    SizedBox(), // placeholder for Add
    SearchPage(),
    SettingsPage(),
  ];

  void _onTabChanged(int index) async {
    if (index == 2) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AddTransactionPage()),
      );

      if (result != null) {
        // TODO: send to HomeController / Provider
        // context.read<HomeController>().addTransaction(result);
      }
      return;
    }

    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavBar(
        currentIndex: _index,
        onChanged: _onTabChanged,
      ),
    );
  }
}
