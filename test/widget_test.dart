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

    // Tom and Jerry and the Maintenance system both have 8 screenshots,
    // so take the first chip (Tom and Jerry is listed first).
    await tester.tap(find.text('8 screenshots').first);
    await tester.pumpAndSettle();

    // The gallery opens on the first screenshot.
    expect(find.text('Splash screen'), findsOneWidget);
    expect(find.text('1 of 8'), findsOneWidget);
  });

  testWidgets('Library system card opens its screenshot gallery', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(900, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.text('Interests'));
    await tester.pumpAndSettle();

    // Only the library project has 11 screenshots.
    await tester.tap(find.text('11 screenshots'));
    await tester.pumpAndSettle();

    expect(find.text('Staff login'), findsOneWidget);
    expect(find.text('1 of 11'), findsOneWidget);
  });

  testWidgets('Personal tab has a Download CV button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Download CV'), findsOneWidget);
  });

  testWidgets('Skills tab groups the technical skills', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(900, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.text('Skills'));
    await tester.pumpAndSettle();

    expect(find.text('Programming'), findsOneWidget);
    expect(find.text('Web Development'), findsOneWidget);
    expect(find.text('Networking & Cisco'), findsOneWidget);
    expect(find.text('IT Support & Tools'), findsOneWidget);
    expect(find.text('Flutter & Dart'), findsOneWidget);
  });

  testWidgets('Project cards list their key features', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(900, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.text('Interests'));
    await tester.pumpAndSettle();

    expect(find.text('Player accounts with a leaderboard'), findsOneWidget);
    expect(
      find.text('Attendance logging with a visitors-per-hour chart'),
      findsOneWidget,
    );
  });

  testWidgets('Contact tab lists the references', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(900, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.text('Contact'));
    await tester.pumpAndSettle();

    expect(find.text('References'), findsOneWidget);
    expect(find.text('Engr. Salem M. Layio'), findsOneWidget);
    expect(find.text('Mr. Art Platon'), findsOneWidget);
  });
}
