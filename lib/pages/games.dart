import 'package:CulturaGame/common/menu.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(0, isInactive: true),
      body: sidePageTopBar(
        context,
        hasLogo: true,
        name: 'Games',
        icon: 'games',
        content: [],
      ),
    );
  }
}
