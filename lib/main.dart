

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcial/config/router/app_router.dart';
import 'package:parcial/config/theme.dart';
import 'package:parcial/presentation/screens/homeScreen.dart';
import 'package:parcial/providers/theme_provider.dart';

void main (){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final int value = ref.watch(selectColorProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme (selectColor: value).themeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}