import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navcheck_key/main.dart';

void main() {
  testWidgets('Navigation bar switches screens', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Verify the initial screen
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Favorites Screen'), findsNothing);
    expect(find.text('Profile Screen'), findsNothing);

    // Tap on the Favorites tab
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify the Favorites screen is displayed
    expect(find.text('Home Screen'), findsNothing);
    expect(find.text('Favorites Screen'), findsOneWidget);
    expect(find.text('Profile Screen'), findsNothing);

    // Tap on the Profile tab
    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();

    // Verify the Profile screen is displayed
    expect(find.text('Home Screen'), findsNothing);
    expect(find.text('Favorites Screen'), findsNothing);
    expect(find.text('Profile Screen'), findsOneWidget);

    // Tap on the Home tab
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    // Verify the Home screen is displayed again
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Favorites Screen'), findsNothing);
    expect(find.text('Profile Screen'), findsNothing);
  });
}
