import 'package:flutter/material.dart';
import '../common/bottom_nav.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(currentIndex: 0),
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(child: Text('Welcome to SmartLearn AI')),
    );
  }
}
