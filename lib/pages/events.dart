import 'package:CulturaGame/common/menu.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(0),
      body: sidePageTopBar(
        context,
        hasLogo: true,
        name: 'Eventos',
        icon: 'events',
        content: [],
      ),
    );
  }
}
