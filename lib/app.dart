import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared/constants/app_theme.dart';

class YogolyzerApp extends ConsumerWidget {
  const YogolyzerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Yogolyzer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Scaffold(
        body: Center(
          child: Text('Yogolyzer'),
        ),
      ),
    );
  }
}
