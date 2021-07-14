import 'package:flutter/material.dart';
import 'package:post_afrique/models/categorie-post.dart';
import 'package:post_afrique/models/post-model.dart';
import 'package:post_afrique/screen/categorie-screen.dart';
import 'package:post_afrique/screen/home-screen.dart';
import 'package:post_afrique/screen/read-post.dart';
import 'package:post_afrique/utils/colors-by-dii.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:statusbar/statusbar.dart';

void main() {
  runApp(MyApp());
}

late _MyAppState appState;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() {
    appState = _MyAppState();
    return appState;
  }
}

class _MyAppState extends State<MyApp> {
  List<PostModel> listePosts = [];
  List<PostModel> listePostsCategories = [];
  List<CategorieModel> listeCategories = [];
  late PostModel postModel;
  late String categorie;
  bool chargement = false;
  @override
  Widget build(BuildContext context) {
    StatusBar.color(blanc);
    return MaterialApp(
      title: 'Post Afrique',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/read-post': (context) => ReadPost(),
        '/categorie': (context) => CategorieScreen()
      },
    );
  }
}
