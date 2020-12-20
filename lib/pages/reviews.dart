import 'dart:io';

import 'package:CulturaGame/blocs/rss/all.dart';
import 'package:CulturaGame/common/menu.dart';
import 'package:CulturaGame/common/tags.dart';
import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webfeed/domain/rss_item.dart';

class ReviewsPage extends StatefulWidget {
  final bool hasLogo;

  ReviewsPage({this.hasLogo = false});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  TextTheme _textTheme = appTheme().textTheme;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RSSBloc>(context).add(GetEspecificRSSEvent('review'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(context),
      bottomNavigationBar: BottomMenu(3),
      body: BlocBuilder<RSSBloc, RSSState>(
        builder: (BuildContext context, RSSState state) {
          if (state.isLoading || state.data == null || state.data['review'] == null) {
            return commonTopBar(
              context,
              hasLogo: widget.hasLogo,
              content: [
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.yellow),
                  ),
                ),
              ],
            );
          } else if (state.error != null) {
            return commonTopBar(context, hasLogo: widget.hasLogo, content: [
              Text(
                state.error,
                style: _textTheme.bodyText1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  // fontSize: 9,
                ),
              )
            ]);
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
                      itemCount: state.data['review'].items.length,
                      itemBuilder: (BuildContext context, int index) {
                        RssItem item = state.data['review'].items[index];
                        String pubDate = item.pubDate.split('+').first + 'GMT';
                        DateTime parsePubDate = HttpDate.parse(pubDate);
                        String timeDifference = DateTime.now().difference(parsePubDate).inDays > 1
                            ? DateTime.now().difference(parsePubDate).inDays.toString() + ' dias atrás'
                            : DateTime.now().difference(parsePubDate).inDays == 1
                                ? DateTime.now().difference(parsePubDate).inDays.toString() + ' dia atrás'
                                : DateTime.now().difference(parsePubDate).inHours.toString() + 'h atrás';
                        if (index == 0) {
                          // big news
                          List temp = item.categories != null
                              ? item.categories.map(
                                  (e) {
                                    if (!e.value.contains('Notícias') &&
                                        !e.value.contains('Games') &&
                                        !e.value.contains('Review')) {
                                      return Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: getTag(e.value, hasTopMargin: false),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ).toList()
                              : [];
                          List<Widget> infos = [
                            ...temp,
                            Spacer(),
                            Icon(Icons.access_time, size: 10),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                timeDifference,
                                style: _textTheme.bodyText1.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          ];

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
                                image: item.content != null &&
                                        item.content.images != null &&
                                        item.content.images.isNotEmpty &&
                                        item.content.images.first != null
                                    ? DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(item.content.images.first),
                                      )
                                    : null,
                              ),
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10, bottom: 5),
                                    child: Text(
                                      item.title ?? '',
                                      style: _textTheme.bodyText2
                                          .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
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
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: infos,
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
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  image: item.content.images != null && item.content.images.isNotEmpty
                                      ? DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(item.content.images.first),
                                        )
                                      : null,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 5, bottom: 5),
                                        child: Text(
                                          item.title,
                                          style: _textTheme.bodyText1.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                      Row(
                                        children: item.categories != null
                                            ? item.categories.map(
                                                (e) {
                                                  if (!e.value.contains('Notícias') &&
                                                      !e.value.contains('Games') &&
                                                      !e.value.contains('Review')) {
                                                    return Container(
                                                      margin: EdgeInsets.only(left: 5),
                                                      child: getTag(e.value),
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                },
                                              ).toList()
                                            : Container(),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 5, left: 5),
                                        child: Row(
                                          children: [
                                            Icon(Icons.access_time, size: 10),
                                            SizedBox(width: 5),
                                            Text(
                                              timeDifference,
                                              style: _textTheme.bodyText1.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 9,
                                              ),
                                            ),
                                          ],
                                        ),
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
