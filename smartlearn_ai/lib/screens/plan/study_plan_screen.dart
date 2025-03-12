import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/outline_provider.dart';
import '../common/bottom_nav.dart';

class StudyPlanScreen extends ConsumerWidget {
  const StudyPlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outline = ref.watch(outlineProvider);

    return Scaffold(
      bottomNavigationBar: const BottomNav(currentIndex: 2),
      appBar: AppBar(title: const Text('Study Plan')),
      body: outline == null
          ? const Center(child: Text('Upload an outline first.'))
          : ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Course: ${outline.title} (${outline.code})', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          const Text('Objectives:', style: TextStyle(fontWeight: FontWeight.bold)),
          ...outline.objectives.map((e) => ListTile(title: Text(e))),
          const SizedBox(height: 10),
          const Text('Study Materials:', style: TextStyle(fontWeight: FontWeight.bold)),
          ...outline.studyMaterials.map((e) => ListTile(title: Text(e))),
        ],
      ),
    );
  }
}
