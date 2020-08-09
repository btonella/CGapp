import 'package:CulturaGame/common/menu.dart';
import 'package:CulturaGame/common/tags.dart';
import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  bool hasLogo;

  ReviewsPage({this.hasLogo = false});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double distance = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(context),
        bottomNavigationBar: BottomMenu(3),
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent[200],
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent[200],
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Primeiras impressões |\nGhost Of Tsushima',
                                    style: appTheme()
                                        .textTheme
                                        .bodyText1
                                        .copyWith(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 13)),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    getTag('REVIEW'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    getTag('GAMES')
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            CGAppBar(context, hasLogo: widget.hasLogo)
          ],
        ));
  }
}
