class Category{
  String categoryTitle;
  String categoryId;

  Category.data({this.categoryTitle, this.categoryId});
  Category();
  factory Category.fromJson(Map<dynamic, dynamic> catJson){
    return Category.data(
        categoryId: catJson['categroyId'],
        categoryTitle: catJson['categoryTitle'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> userData = new Map<String, dynamic>();
    userData['categoryTitle'] = this.categoryTitle;
    userData['categoryTitle'] = this.categoryTitle;
    return userData;
  }
}