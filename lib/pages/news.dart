import 'package:CulturaGame/blocs/rss/all.dart';
import 'package:CulturaGame/common/menu.dart';
import 'package:CulturaGame/common/tags.dart';
import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webfeed/webfeed.dart';

class NewsPage extends StatefulWidget {
  final bool hasLogo;

  NewsPage({this.hasLogo = false});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  TextTheme _textTheme = appTheme().textTheme;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RSSBloc>(context).add(UpdateRSSEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(0),
      body: BlocBuilder<RSSBloc, RSSState>(
        builder: (BuildContext context, RSSState state) {
          if (state.isLoading || state.data == null) {
            return CircularProgressIndicator();
          } else {
            // print('RSS data: ' + state.data.toString());
            return SingleChildScrollView(
              child: commonTopBar(
                context,
                hasLogo: widget.hasLogo,
                content: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5.0),
                      itemCount: state.data.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        RssItem item = state.data.items[index];
                        if (index == 0) {
                          // big news
                          return Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              // width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(item.content.images.first),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10, bottom: 5),
                                    child: Text(
                                      item.title,
                                      style: _textTheme.bodyText2.copyWith(
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: item.categories
                                            .map(
                                              (e) => Container(
                                                margin: EdgeInsets.only(left: 5),
                                                child: getTag(e.value),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        // other news
                        return Container(
                          padding: EdgeInsets.all(5),
                          height: MediaQuery.of(context).size.height * 0.15,
                          // width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  image: item.content.images.isNotEmpty
                                      ? DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(item.content.images.first),
                                        )
                                      : null,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item.title,
                                        style: _textTheme.bodyText1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 11,
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          getTag('NOTÍCIAS'),
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
