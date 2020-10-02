import 'package:CulturaGame/blocs/rss/all.dart';
import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/pages/news.dart';
import 'package:CulturaGame/router.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RSSBloc>(
          create: (BuildContext context) => RSSBloc(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
