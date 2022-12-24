class CastModel{
  int? _id;
  List<Cast>? _cast = [];

  int? get id => _id;
  List<Cast>? get cast => _cast;

  CastModel({required id, required cast}){
    _id = id;
    _cast = cast;
  }

  CastModel.fromJson(Map<String, dynamic> json) {
    _id = id;
    print(json.toString());
    _cast = <Cast>[];
    if (json['cast'] != null) {
      json['cast'].forEach((v) {
        _cast?.add(Cast.fromJson(v));
      });
    }

  }

}
class Cast{

  int? id;
  bool? adult;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Cast({
    this.id,
    this.adult,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Cast.fromJson(Map<String, dynamic> cast) {
    id = cast['id'];
    adult = cast['adult'];
    knownForDepartment = cast['known_for_department'];
    name = cast['name'];
    originalName = cast['original_name'];
    popularity = cast['popularity'];
    profilePath = cast['profile_path'];
    castId = cast['cast_id'];
    character = cast['character'];
    creditId = cast['credit_id'];
    order = cast['order'];

  }

}