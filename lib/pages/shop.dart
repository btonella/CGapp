import 'package:CulturaGame/common/menu.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(0, isInactive: true),
      body: sidePageTopBar(
        context,
        hasLogo: true,
        name: 'Loja',
        icon: 'shop',
        content: [],
      ),
    );
  }
}
