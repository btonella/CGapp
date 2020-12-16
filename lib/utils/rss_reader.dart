import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class RSSReader extends StatefulWidget {
  @override
  _RSSReaderState createState() => _RSSReaderState();
}

class _RSSReaderState extends State<RSSReader> {
  String urlFeed = 'http://culturagame.com.br/feed/';

  static const String loadingMessage = 'Loading Feed...';
  static const String feedLoadErrorMessage = 'Error Loading Feed.';
  // static const String feedOpenErrorMessage = 'Error Opening Feed.';

  GlobalKey<RefreshIndicatorState> _refreshKey;
  RssFeed _feed;
  String _title;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  // Future<void> openFeed(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       forceWebView: false,
  //     );
  //     return;
  //   }
  //   updateTitle(feedOpenErrorMessage);
  // }

  load() async {
    updateTitle(loadingMessage);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        // Notify user of error.
        updateTitle(feedLoadErrorMessage);
        return;
      }
      // If there is no error, load the RSS data into the _feed object.
      updateFeed(result);
      // Reset the title.
      updateTitle("<Hacker News\\> | Jobs Feed");
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(urlFeed);
      return RssFeed.parse(response.body);
    } catch (e) {
      // handle any exceptions here
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(_title);
    load();
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  list() {
    print('feed: ' + _feed.items.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            child: ListView.builder(
              padding: EdgeInsets.all(5.0),
              itemCount: _feed.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _feed.items[index];
                return Container(
                  margin: EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  decoration: customBoxDecoration(),
                  child: ListTile(
                      title: title(item.title),
                      subtitle: subtitle(item.pubDate),
                      trailing: rightIcon(),
                      contentPadding: EdgeInsets.all(5.0),
                      onTap: null //() => openFeed(item.link),
                      ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Method that returns the Text Widget for the title of our RSS data.
  title(title) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Method that returns the Text Widget for the subtitle of our RSS data.
  subtitle(subTitle) {
    return Text(
      subTitle,
      // style: TextStyle(
      //     fontSize: 15.0,
      //     fontWeight: FontWeight.w300,
      // color: colorHackerHeading
      // ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Method that returns Icon Widget.
  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.red,
      size: 30.0,
    );
  }

  // Custom box decoration for the Container Widgets.
  BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.blue, // border color
        width: 1.0,
      ),
    );
  }

  Map<String, dynamic> getRSSNews() {
    Map<String, dynamic> resp;
    _feed.items.map((item) {
      resp[title(item.title)] = {
        'subtitle': subtitle(item.pubDate),
        'urlThumb': item.media.thumbnails[0].url,
        'author': item.author,
      };
    });
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: colorHackerBackground,
        appBar: AppBar(
          title: Text(_title),
        ),
        body: body(),
      ),
    );
  }
}
