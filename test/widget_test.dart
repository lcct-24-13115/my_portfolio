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
}