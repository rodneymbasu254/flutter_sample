import 'package:flutter/material.dart';
import '../upload/upload_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = const [
    UploadScreen(),
    Center(child: Text('Study Plan')),
    Center(child: Text('Readiness Score')),
    Center(child: Text('Past Papers')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.upload_file), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Plan'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Readiness'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Past Papers'),
        ],
      ),
    );
  }
}