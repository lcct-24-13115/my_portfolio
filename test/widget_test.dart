import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_portfolio/main.dart';

void main() {
  setUp(() {
    // Fake storage so the tests do not touch the real browser/device.
    SharedPreferences.setMockInitialValues({});
  });

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
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.light_mode), findsOneWidget);
  });

  testWidgets('Dark mode choice is saved', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.byIcon(Icons.dark_mode));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 100));

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(themePrefKey), isTrue);
  });

  testWidgets('App starts in dark mode when it was saved', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const PortfolioApp(initialThemeMode: ThemeMode.dark),
    );

    // In dark mode the button offers to switch back to light.
    expect(find.byIcon(Icons.light_mode), findsOneWidget);
  });

  testWidgets('Skills tab filter chips narrow the certificates', (
    WidgetTester tester,
  ) async {
    // Tall screen so the whole (lazily built) list is on screen.
    tester.view.physicalSize = const Size(900, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.text('Skills'));
    await tester.pumpAndSettle();

    expect(find.text('All'), findsOneWidget);
    expect(find.text('Networking'), findsOneWidget);

    // The Web filter hides the networking certificates.
    await tester.tap(find.text('Web'));
    await tester.pumpAndSettle();
    expect(find.text('HTML Essentials'), findsOneWidget);
    expect(find.text('Networking Basics'), findsNothing);
  });

  testWidgets('Tom and Jerry card opens its screenshot gallery', (
    WidgetTester tester,
  ) async {
    // Tall screen so the whole (lazily built) list is on screen.
    tester.view.physicalSize = const Size(900, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.text('Interests'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('8 screenshots'));
    await tester.pumpAndSettle();

    // The gallery opens on the first screenshot.
    expect(find.text('Splash screen'), findsOneWidget);
    expect(find.text('1 of 8'), findsOneWidget);
  });
}
