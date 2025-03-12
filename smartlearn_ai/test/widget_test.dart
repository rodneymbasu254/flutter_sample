import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smartlearn_ai/app.dart'; // This file contains SmartLearnApp

void main() {
  testWidgets('App renders main screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartLearnApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
