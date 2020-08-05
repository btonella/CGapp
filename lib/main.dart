import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: 'Cultura Game',
        theme: appTheme(),
        home: HomePage(title: 'CulturaGame'));
  }
}
