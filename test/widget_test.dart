import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/main.dart';

void main() {
  testWidgets('Portfolio shows all five tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Personal'), findsOneWidget);
    expect(find.text('Education'), findsOneWidget);
    expect(find.text('Skills'), findsOneWidget);
    expect(find.text('Interests'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);
  });

  testWidgets('Dark mode button switches the theme', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PortfolioApp());

    // Starts in light mode, so the button offers dark mode.
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);

    await tester.tap(find.byIcon(Icons.dark_mode));
    await tester.pump();

    expect(find.byIcon(Icons.light_mode), findsOneWidget);
  });
}
