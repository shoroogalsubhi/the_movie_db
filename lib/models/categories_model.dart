class CategoriesModel{
  List<CategoryModel>? _category = [];

  List<CategoryModel>? get category => _category;

  CategoriesModel({required category}){
    _category = category;
  }

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    _category = <CategoryModel>[];
    Map<String, dynamic> all = {"id":-1,"name":"All"};
    _category?.add(CategoryModel.fromJson(all));
    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        _category?.add(CategoryModel.fromJson(v));
      });
    }

  }

}
class CategoryModel{
  int? id;
  String? name;

  CategoryModel({
    this.id,
    this.name,
  });

  CategoryModel.fromJson(Map<String, dynamic> category) {
    id = category['id'];
    name = category['name'];

  }

}