import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_siges/app/modules/welcome/welcome_page.dart';

main() {
  testWidgets('WelcomePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(WelcomePage(title: 'Welcome')));
    final titleFinder = find.text('Welcome');
    expect(titleFinder, findsOneWidget);
  });
}
