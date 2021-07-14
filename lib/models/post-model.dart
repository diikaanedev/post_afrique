import 'package:post_afrique/models/categorie-post.dart';

class PostModel {
  final int id;
  final String title;
  final String content;
  final List categories;
  final String sourceUrl;
  final String date;

  PostModel(
      {required this.id,
      required this.date,
      required this.title,
      required this.content,
      required this.categories,
      required this.sourceUrl});

  static fromJson(List l) {
    List<PostModel> listes = [];
    for (var item in l) {
      listes.add(PostModel(
          id: item['id'],
          date: item['date'],
          title: item['title']['rendered'],
          content: item['content']['rendered'],
          categories: item['categories'],
          sourceUrl: item['better_featured_image']['source_url']));
    }
    return listes;
  }
}
