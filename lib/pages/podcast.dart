import 'package:CulturaGame/common/menu.dart';
import 'package:CulturaGame/common/tags.dart';
import 'package:CulturaGame/common/theme.dart';
import 'package:flutter/material.dart';

class PodcastPage extends StatefulWidget {
  final bool hasLogo;

  PodcastPage({this.hasLogo = false});

  @override
  _PodcastPageState createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(2),
      body: commonTopBar(
        context,
        hasLogo: widget.hasLogo,
        content: [
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
                      Text('CGCast Episódio 4 |\nHistória dos Jogos',
                          style: appTheme()
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          getTag('PODCAST'),
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
    );
  }
}
