import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

// ignore: non_constant_identifier_names
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
  final int currentIndex;
  BottomMenu(this.currentIndex);
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex;
  // final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

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

Widget sideMenuIcon(BuildContext context, String name, String icon, {bool isLast}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/icon_$icon.png',
                  height: 25,
                ),
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16, color: AppColors.grey),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            height: 1,
            color: AppColors.grey.withOpacity(0.3),
          ),
        )
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget SideMenu(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.55,
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10),
                height: MediaQuery.of(context).size.height * 0.2,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo-G.png',
                  height: 60,
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  sideMenuIcon(context, 'Games', 'games'),
                  sideMenuIcon(context, 'Cinema', 'movies'),
                  sideMenuIcon(context, 'Séries', 'series'),
                  sideMenuIcon(context, 'Livros e HQs', 'books'),
                  sideMenuIcon(context, 'Eventos', 'events'),
                  sideMenuIcon(context, 'Loja', 'shop'),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.grey,
                        )),
                    child: Icon(
                      FlutterIcons.person_outline_mdi,
                      size: 18,
                      color: AppColors.grey,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    FlutterIcons.setting_ant,
                    size: 20,
                    color: AppColors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
