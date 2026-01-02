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
    HomePage(),
    Scaffold(body: Center(child: Text('Analysis'))),
    SizedBox(), // Add (modal)
    SearchPage(),
    Scaffold(body: Center(child: Text('Settings'))),
  ];

  void _onTabChanged(int index) {
    if (index == 2) {
      // open add transaction modal
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
