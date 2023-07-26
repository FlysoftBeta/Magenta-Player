import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magenta_player/utils/element_sizes.dart';

import 'routers/routers.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElementSizes(
        fontBig: max(min(40, screenWidth * 0.03), 30),
        fontMedium: max(min(25, screenWidth * 0.03), 30),
        iconBig: max(min(60, screenWidth * 0.03), 30),
        iconMedium: max(min(40, screenWidth * 0.03), 25),
        paddingBig: max(min(40, screenWidth * 0.03), 20),
        paddingMedium: max(min(30, screenWidth * 0.025), 15),
        paddingSmall: max(min(10, screenWidth * 0.01), 8),
        borderRadiusBig: 16,
        borderRadiusMedium: 8,
        child: MaterialApp.router(
          title: 'Magenta Player',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.dark),
            useMaterial3: true,
          ),
          routerConfig: _appRouter.config(),
        ));
  }
}
