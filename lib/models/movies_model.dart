
class MoviesModel {
  int? _page;
  int? _totalResults;
  int? _totalPages;
  List<Result>? _results = [];

  int? get page => _page;
  int? get totalResults => _totalResults;
  int? get totalPages => _totalPages;
  List<Result>? get results => _results;

  MoviesModel({required page, required totalResults,
    required totalPages, required results}){
    _page = page;
    _totalResults = totalResults;
    _totalPages = totalPages;
    _results = results;
  }

  MoviesModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    if (parsedJson['results'] != null) {
      _results = <Result>[];
      parsedJson['results'].forEach((v) {
        _results?.add(Result.fromJson(v));
      });
    }
  }

}

class Result {
  int? id;
  int? voteCount;
  bool? video;
  String? voteAverage;
  String? title;
  double? popularity;
  String? posterPath;
  String? originalLanguage;
  String? originalTitle;
  List? genres = [];
  String? backdropPath;
  bool? adult;
  String? overview;
  String? releaseDate;

  Result({
    this.id,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genres,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Result.fromJson(Map<String, dynamic> result) {
    voteCount = result['vote_count'];
    id = result['id'];
    video = result['video'];
    voteAverage = result['vote_average'].toStringAsFixed(1);
    title = result['title'];
    popularity = result['popularity'];
    posterPath = result['poster_path'];
    originalLanguage = result['original_language'];
    originalTitle = result['original_title'];
    // genres type is array[integer]
    if(result['genre_ids'] != null){
      genres?.addAll(result['genre_ids']);
      // in movie details the genres called genres an
      // the type is array[object] (map) ex: => {id: 1, name: a}
    }else if(result['genres'] != null){
      for(var genre in result['genres']){
        genres?.add(
            {'id':genre['id'],
              'name':genre['name']}
        );
      }
    }
    backdropPath = result['backdrop_path'];
    adult = result['adult'];
    overview = result['overview'];
    releaseDate = result['release_date'];
  }

}
