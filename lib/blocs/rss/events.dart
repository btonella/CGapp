part of blocs.rss;

abstract class RSSEvent extends Equatable {}

class GetRSSEvent extends RSSEvent {
  GetRSSEvent();

  @override
  List<Object> get props => [];
}

class UpdateRSSEvent extends RSSEvent {
  UpdateRSSEvent();

  @override
  List<Object> get props => [];
}

class GetEspecificRSSEvent extends RSSEvent {
  final String categorie;
  GetEspecificRSSEvent(this.categorie);

  @override
  List<Object> get props => [];
}

class UpdateEspecificRSSEvent extends RSSEvent {
  final String categorie;
  UpdateEspecificRSSEvent(this.categorie);

  @override
  List<Object> get props => [];
}
