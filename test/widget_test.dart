import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_muliti_part/home_screen.dart';

import 'package:test_muliti_part/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeScreen());
  });
}
