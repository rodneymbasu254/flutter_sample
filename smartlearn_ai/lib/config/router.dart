import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/upload/upload_screen.dart';
import '../screens/plan/study_plan_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, _) => const DashboardScreen()),
      GoRoute(path: '/upload', builder: (context, _) => const UploadScreen()),
      GoRoute(path: '/study-plan', builder: (context, _) => const StudyPlanScreen()),
    ],
  );
});
