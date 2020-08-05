import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

Widget CGAppBar(BuildContext context, {String title}) {
  return AppBar(
    // backgroundColor: Colors.black45,
    // flexibleSpace: Container(
    //   height: 40,
    // ),
    toolbarOpacity: 1,
    elevation: 0,
    title: Text(
      title ?? '',
      style: TextStyle(fontFamily: 'ArcadePix', color: Colors.black),
    ),
    centerTitle: true,
    actions: <Widget>[],
  );
}

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 9,
      unselectedFontSize: 9,
      showSelectedLabels: true,
      backgroundColor: AppColors.yellow,
      selectedItemColor: Colors.black.withAlpha(150),
      unselectedItemColor: Colors.black.withAlpha(150),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment), title: Text('NOTICIAS')),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline), title: Text('VÍDEOS')),
        BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_voice), title: Text('PODCAST')),
        BottomNavigationBarItem(
            icon: Icon(Icons.rate_review), title: Text('REVIEWS')),
      ],
    );
  }
}

Widget SideMenu(BuildContext context) {
  return Drawer(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: AppColors.yellow,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Games',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Cinema',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Séries',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Livros e HQs',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Eventos',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Loja',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              )),
        ],
      ),
    ),
  );
}
