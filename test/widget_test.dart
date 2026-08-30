import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yogolyzer/app.dart';

void main() {
  setUp(() {
    // SharedPreferencesのモック設定
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('YogolyzerApp should build and show splash screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: YogolyzerApp(),
      ),
    );

    // スプラッシュ画面のUIが表示されることを確認
    expect(find.text('Yogolyzer'), findsOneWidget);
    expect(find.text('汚れ診断AI'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // SplashViewModelの2秒タイマーを完了させる
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
