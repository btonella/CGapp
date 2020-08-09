import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/pages/news.dart';
import 'package:CulturaGame/pages/videos.dart';
import 'package:CulturaGame/router.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

Widget CGAppBar(BuildContext context, {bool hasLogo}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarOpacity: 1,
    elevation: 0,
    title: hasLogo
        ? Image.asset(
            'assets/logo-white.png',
            height: 35,
            alignment: Alignment.center,
          )
        : Container(),
    centerTitle: true,
    actions: <Widget>[
      Container(
          margin: EdgeInsets.all(5),
          child: Icon(
            Icons.search,
            size: 25,
          ))
    ],
  );
}

class BottomMenu extends StatefulWidget {
  int currentIndex;
  BottomMenu(this.currentIndex);
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  String getRouteName(index) {
    String name = '/';
    if (index == 0)
      name = '/';
    else if (index == 1)
      name = '/videos/';
    else if (index == 2)
      name = '/podcast/';
    else if (index == 3) name = '/reviews/';

    return name;
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pushNamed(getRouteName(index));
  }

  TextStyle getTheme(index) {
    return appTheme().textTheme.bodyText1.copyWith(
        fontSize: 9, fontWeight: FontWeight.w500, color: _selectedIndex == index ? Colors.black : AppColors.darkYellow);
  }

  String getImage(index, String name) {
    if (_selectedIndex == index) {
      return 'assets/icons/icon_${name}_black.png';
    } else {
      return 'assets/icons/icon_$name.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    //   return SafeArea(
    //     child: Scaffold(
    //       body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoutes()),
    //       bottomNavigationBar: _bottomMenu(),
    //     ),
    //   );
    // }

    // Widget _bottomMenu() {
    double logoSize = 35;

    return BottomNavigationBar(
      elevation: 1,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 9,
      unselectedFontSize: 9,
      showSelectedLabels: true,
      backgroundColor: AppColors.yellow,
      // selectedItemColor: Colors.black.withAlpha(150),
      // unselectedItemColor: Colors.black.withAlpha(150),
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              getImage(0, 'news'),
              height: logoSize,
            ),
            title: Text('NOTICIAS', style: getTheme(0))),
        BottomNavigationBarItem(
            icon: Image.asset(
              getImage(1, 'video'),
              height: logoSize,
            ),
            title: Text('VÍDEOS', style: getTheme(1))),
        BottomNavigationBarItem(
            icon: Image.asset(
              getImage(2, 'podcast'),
              height: logoSize,
            ),
            title: Text('PODCAST', style: getTheme(2))),
        BottomNavigationBarItem(
            icon: Image.asset(
              getImage(3, 'review'),
              height: logoSize,
            ),
            title: Text('REVIEWS', style: getTheme(3))),
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
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Cinema',
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Séries',
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Livros e HQs',
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Eventos',
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Loja',
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
              )),
        ],
      ),
    ),
  );
}
