part of blocs.rss;

class RSSBloc extends Bloc<RSSEvent, RSSState> {
  RSSBloc() : super(RSSState());

  // @override
  // RSSState get initialState => RSSState();

  Map<String, dynamic> data = <String, dynamic>{};

  @override
  Stream<RSSState> mapEventToState(event) async* {
    yield RSSState.loading();
    if (event is GetRSSEvent) {
      print('1');
      try {
        print('2');
        var feed = await http.read('http://culturagame.com.br/feed/').then((xmlString) async* {
          print('xml: ' + xmlString);
          RSSState.success(AtomFeed.parse(xmlString));
          yield AtomFeed.parse(xmlString);
          // return AtomFeed.parse(xmlString);
        });
        print(feed.toString());
        // RSSState.success();
      } catch (e) {
        RSSState.error('Erro ao acessar o RSS');
      }
    } else {
      yield RSSState.error('Evento não implementado.');
    }
  }
}
