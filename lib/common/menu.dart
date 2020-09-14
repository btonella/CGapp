import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/pages/books.dart';
import 'package:CulturaGame/pages/events.dart';
import 'package:CulturaGame/pages/games.dart';
import 'package:CulturaGame/pages/movies.dart';
import 'package:CulturaGame/pages/series.dart';
import 'package:CulturaGame/pages/shop.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

// ignore: non_constant_identifier_names
Widget CGAppBar(BuildContext context, {bool hasLogo = false}) {
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
  final bool isInactive;
  BottomMenu(this.currentIndex, {this.isInactive = false});
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

  TextStyle getTheme(index, bool isInactive) {
    if (isInactive) {
      return appTheme()
          .textTheme
          .bodyText1
          .copyWith(fontSize: 9, fontWeight: FontWeight.w500, color: AppColors.darkYellow);
    }
    return appTheme().textTheme.bodyText1.copyWith(
        fontSize: 9, fontWeight: FontWeight.w500, color: _selectedIndex == index ? Colors.black : AppColors.darkYellow);
  }

  String getImage(index, String name, bool isInactive) {
    if (isInactive) {
      return 'assets/icons/icon_$name.png';
    } else {
      if (_selectedIndex == index) {
        return 'assets/icons/icon_${name}_black.png';
      } else {
        return 'assets/icons/icon_$name.png';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              getImage(0, 'news', widget.isInactive),
              height: logoSize,
            ),
            title: Text('NOTICIAS', style: getTheme(0, widget.isInactive))),
        BottomNavigationBarItem(
            icon: Image.asset(
              getImage(1, 'video', widget.isInactive),
              height: logoSize,
            ),
            title: Text('VÍDEOS', style: getTheme(1, widget.isInactive))),
        BottomNavigationBarItem(
            icon: Image.asset(
              getImage(2, 'podcast', widget.isInactive),
              height: logoSize,
            ),
            title: Text('PODCAST', style: getTheme(2, widget.isInactive))),
        BottomNavigationBarItem(
            icon: Image.asset(
              getImage(3, 'review', widget.isInactive),
              height: logoSize,
            ),
            title: Text('REVIEWS', style: getTheme(3, widget.isInactive))),
      ],
    );
  }
}

Widget sideMenuIcon(BuildContext context,
    {@required String name, @required String icon, @required Function onTap, bool isLast}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        GestureDetector(
          onTap: onTap,
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
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
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
                  sideMenuIcon(
                    context,
                    name: 'Games',
                    icon: 'games',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => GamesPage()));
                    },
                  ),
                  sideMenuIcon(
                    context,
                    name: 'Cinema',
                    icon: 'movies',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MoviesPage()));
                    },
                  ),
                  sideMenuIcon(
                    context,
                    name: 'Séries',
                    icon: 'series',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SeriesPage()));
                    },
                  ),
                  sideMenuIcon(
                    context,
                    name: 'Livros e HQs',
                    icon: 'books',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BooksPage()));
                    },
                  ),
                  sideMenuIcon(
                    context,
                    name: 'Eventos',
                    icon: 'events',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EventsPage()));
                    },
                  ),
                  sideMenuIcon(
                    context,
                    name: 'Loja',
                    icon: 'shop',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ShopPage()));
                    },
                  ),
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

Widget commonTopBar(BuildContext context, {@required List<Widget> content, bool hasLogo = false}) {
  double distance = 150.0;

  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 50),
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.yellow,
        ),
        alignment: Alignment.topCenter,
        child: SizedBox.expand(
          child: Image.asset(
            'assets/logo-white.png',
            alignment: Alignment.center,
          ),
        ),
      ),
      Positioned(
        top: distance,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: [],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: distance + 30.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: content,
          ),
        ),
      ),
      CGAppBar(context, hasLogo: hasLogo)
    ],
  );
}

Widget sidePageTopBar(BuildContext context,
    {@required List<Widget> content, @required String name, @required String icon, bool hasLogo = false}) {
  double distance = 150.0;

  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: distance - 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: content,
          ),
        ),
      ),
      CGAppBar(context, hasLogo: hasLogo),
      Container(
        margin: EdgeInsets.only(top: 75),
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Container(
              child: Text(
                name.toUpperCase(),
                style: appTheme().textTheme.bodyText1.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              margin: EdgeInsets.only(left: 50),
            ),
            Spacer(),
            Container(
              child: Image.asset(
                'assets/icons/icon_${icon}_big.png',
                height: 100,
              ),
              // margin: EdgeInsets.only(right: 30),
            ),
          ],
        ),
      ),
      // Positioned(
      //   top: distance,
      //   child: Container(
      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       // borderRadius: BorderRadius.only(
      //       //   topLeft: Radius.circular(20),
      //       //   topRight: Radius.circular(20),
      //       // ),
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       // children: [],
      //     ),
      //   ),
      // ),
    ],
  );
}
