import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/pages/news.dart';
import 'package:CulturaGame/router.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: generateRoutes(),
      navigatorKey: navigatorKey,
      theme: appTheme(),
      home: Container(
        color: AppColors.yellow,
        child: SafeArea(
          child: NewsPage(),
        ),
      ),
    );
  }
}
