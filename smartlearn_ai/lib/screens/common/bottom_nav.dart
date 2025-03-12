import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  const BottomNav({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        if (index == 0) context.go('/');
        if (index == 1) context.go('/upload');
        if (index == 2) context.go('/study-plan');
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        NavigationDestination(icon: Icon(Icons.upload_file), label: 'Upload'),
        NavigationDestination(icon: Icon(Icons.book), label: 'Study Plan'),
      ],
    );
  }
}
