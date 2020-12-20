part of blocs.rss;

class RSSBloc extends Bloc<RSSEvent, RSSState> {
  RSSBloc() : super(RSSState());

  // @override
  // RSSState get initialState => RSSState();

  Map<String, RssFeed> _feed;
  String urlFeed = 'http://culturagame.com.br/feed/';
  String genericUrl = 'http://culturagame.com.br/';

  @override
  Stream<RSSState> mapEventToState(event) async* {
    yield RSSState.loading();
    if (event is GetRSSEvent) {
      if (_feed != null && _feed['general'] != null) {
        yield RSSState.success(_feed);
      } else {
        try {
          final client = http.Client();
          final response = await client.get(urlFeed);
          var resp = RssFeed.parse(response.body);
          _feed['general'] = resp;
          yield RSSState.success(_feed);
        } catch (e) {
          yield RSSState.error('Erro ao acessar o general RSS');
        }
      }
    } else if (event is UpdateRSSEvent) {
      try {
        final client = http.Client();
        final response = await client.get(urlFeed);
        var resp = RssFeed.parse(response.body);
        _feed['general'] = resp;
        yield RSSState.success(_feed);
      } catch (e) {
        yield RSSState.error('Erro ao atualizar o general RSS');
      }
    } else if (event is GetEspecificRSSEvent) {
      if (_feed != null && _feed[event.categorie] != null) {
        yield RSSState.success(_feed);
      } else {
        try {
          final client = http.Client();
          final response = await client.get(genericUrl + 'category/' + event.categorie + '/feed/');
          var resp = RssFeed.parse(response.body);
          _feed[event.categorie] = resp;
          yield RSSState.success(_feed);
        } catch (e) {
          yield RSSState.error('Erro ao acessar o ${event.categorie} RSS');
        }
      }
    } else if (event is UpdateEspecificRSSEvent) {
      try {
        final client = http.Client();
        final response = await client.get(genericUrl + 'category/' + event.categorie + '/feed/');
        var resp = RssFeed.parse(response.body);
        _feed[event.categorie] = resp;
        yield RSSState.success(_feed);
      } catch (e) {
        yield RSSState.error('Erro ao atualizar o ${event.categorie} RSS');
      }
    } else {
      yield RSSState.error('Evento não implementado.');
    }
  }
}
