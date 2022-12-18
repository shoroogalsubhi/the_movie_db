class MoviesModel {
  int? _page;
  int? _total_results;
  int? _total_pages;
  List<Result>? _results = [];

  int? get page => _page;
  int? get total_results => _total_results;
  int? get total_pages => _total_pages;
  List<Result>? get results => _results;

  MoviesModel({required page, required total_results,
    required total_pages, required results}){
    this._page = page;
    this._total_results = total_results;
    this._total_pages = total_pages;
    this._results = results;
  }

  MoviesModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    if (parsedJson['results'] != null) {
      _results = <Result>[];
      parsedJson['results'].forEach((v) {
        _results?.add(Result.fromJson(v));
      });
    }
  }

}

class Result {
  int? vote_count;
  int? id;
  bool? video;
  String? vote_average;
  String? title;
  double? popularity;
  String? poster_path;
  String? original_language;
  String? original_title;
  List<int>? genre_ids = [];
  String? backdrop_path;
  bool? adult;
  String? overview;
  String? release_date;
  Result({
    this.id,
    this.vote_count,
    this.video,
    this.vote_average,
    this.title,
    this.popularity,
    this.poster_path,
    this.original_language,
    this.original_title,
    this.genre_ids,
    this.backdrop_path,
    this.adult,
    this.overview,
    this.release_date,
  });



  Result.fromJson(Map<String, dynamic> result) {
    vote_count = result['vote_count'];
    id = result['id'];
    video = result['video'];
    vote_average = result['vote_average'].toString();
    title = result['title'];
    popularity = result['popularity'];
    poster_path = result['poster_path'];
    original_language = result['original_language'];
    original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      genre_ids?.add(result['genre_ids'][i]);
    }
    backdrop_path = result['backdrop_path'];
    adult = result['adult'];
    overview = result['overview'];
    release_date = result['release_date'];
  }

}
