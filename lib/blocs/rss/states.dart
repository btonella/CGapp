part of blocs.rss;

// ignore: must_be_immutable
class RSSState extends Equatable {
  String error;
  bool isLoading;
  bool isSuccess;
  Map<String, RssFeed> data;

  RSSState({this.isLoading = false, this.isSuccess = false, this.error, this.data});
  RSSState.loading()
      : isSuccess = false,
        isLoading = true;
  RSSState.success(this.data)
      : isSuccess = true,
        isLoading = false;
  RSSState.error(this.error)
      : isSuccess = false,
        isLoading = false;

  @override
  List<Object> get props => [isLoading, isSuccess];
}
