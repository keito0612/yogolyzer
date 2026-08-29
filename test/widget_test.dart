import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogolyzer/app.dart';

void main() {
  testWidgets('YogolyzerApp should build', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: YogolyzerApp(),
      ),
    );

    expect(find.text('Yogolyzer'), findsOneWidget);
  });
}
