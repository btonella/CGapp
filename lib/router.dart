import 'package:CulturaGame/pages/news.dart';
import 'package:CulturaGame/pages/podcast.dart';
import 'package:CulturaGame/pages/reviews.dart';
import 'package:CulturaGame/pages/videos.dart';
import 'package:flutter/material.dart';

RouteFactory generateRoutes() {
  return (RouteSettings settings) {
    Map<String, Widget> routesMap = {
      '/': NewsPage(),
      '/videos/': VideosPage(),
      '/podcast/': PodcastPage(),
      '/reviews/': ReviewsPage(),
    };

    var screen;
    if (!routesMap.containsKey(settings.name)) {
      throw Exception("Route '${settings.name}' not implemented");
    }
    screen = routesMap[settings.name];

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return screen;
      },
    );
  };
}
