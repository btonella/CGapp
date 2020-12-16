part of blocs.rss;

class RSSBloc extends Bloc<RSSEvent, RSSState> {
  RSSBloc() : super(RSSState());

  // @override
  // RSSState get initialState => RSSState();

  RssFeed _feed;
  String urlFeed = 'http://culturagame.com.br/feed/';

  @override
  Stream<RSSState> mapEventToState(event) async* {
    yield RSSState.loading();
    if (event is GetRSSEvent) {
      if (_feed != null) {
        yield RSSState.success(_feed);
      } else {
        try {
          final client = http.Client();
          final response = await client.get(urlFeed);
          var resp = RssFeed.parse(response.body);
          yield RSSState.success(resp);
        } catch (e) {
          yield RSSState.error('Erro ao acessar o RSS');
        }
      }
    } else if (event is UpdateRSSEvent) {
      try {
        final client = http.Client();
        final response = await client.get(urlFeed);
        var resp = RssFeed.parse(response.body);
        _feed = resp;
        yield RSSState.success(_feed);
      } catch (e) {
        yield RSSState.error('Erro ao acessar o RSS');
      }
    } else {
      yield RSSState.error('Evento não implementado.');
    }
  }
}
