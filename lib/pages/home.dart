import 'package:CulturaGame/common/menu.dart';
import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  bool hasLogo;

  HomePage({this.hasLogo = false});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double distance = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(context),
        // appBar: ,
        bottomNavigationBar: BottomMenu(),
        body: Stack(
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
                  'assets/logo.png',
                  // height: 30,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned(
              // height: MediaQuery.of(context).size.height,
              top: distance,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Faça cadastro'),
                    Text('Continue sem notícias exclusivas')
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: distance + 30.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[200],
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  )
                ],
              ),
            ),
            CGAppBar(context, hasLogo: widget.hasLogo)
          ],
        ));
  }
}
