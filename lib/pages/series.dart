import 'package:CulturaGame/common/menu.dart';
import 'package:flutter/material.dart';

class SeriesPage extends StatefulWidget {
  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(0),
      body: sidePageTopBar(
        context,
        hasLogo: true,
        name: 'Séries',
        icon: 'series',
        content: [],
      ),
    );
  }
}
