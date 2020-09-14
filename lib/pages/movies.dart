import 'package:CulturaGame/common/menu.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(0, isInactive: true),
      body: sidePageTopBar(
        context,
        hasLogo: true,
        name: 'Cinema',
        icon: 'movies',
        content: [],
      ),
    );
  }
}
