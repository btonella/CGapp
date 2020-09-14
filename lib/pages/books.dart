import 'package:CulturaGame/common/menu.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(0),
      body: sidePageTopBar(
        context,
        hasLogo: true,
        name: 'Livros\ne HQs',
        icon: 'books',
        content: [],
      ),
    );
  }
}
