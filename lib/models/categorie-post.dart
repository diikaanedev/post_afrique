class CategorieModel {
  final int id;
  final String name;
  final String slug;

  CategorieModel({required this.id, required this.name, required this.slug});

  static fromJson(List l) {
    List<CategorieModel> listes = [];
    for (var item in l) {
      listes.add(CategorieModel(
          id: item['id'], name: item['name'], slug: item['slug']));
    }
    return listes;
  }
}
