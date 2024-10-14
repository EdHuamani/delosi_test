import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';

class MatrixApp extends ConsumerWidget {
  const MatrixApp({super.key});
  static const primaryColor = Colors.green;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      themeMode: ThemeMode.system,
    );
  }
}
