import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:post_afrique/main.dart';
import 'package:post_afrique/models/categorie-post.dart';
import 'package:post_afrique/models/post-model.dart';
import 'package:post_afrique/utils/colors-by-dii.dart';
import 'package:http/http.dart' as http;
import 'package:post_afrique/widget/card-new-en-continue.dart';
import 'package:post_afrique/widget/card-new-top.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;

  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  late ScrollController controllerContinu;

  int page = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      controllerContinu = ScrollController();
    });
    getPost();
    controllerContinu.addListener(() {
      if (controllerContinu.offset >=
              controllerContinu.position.maxScrollExtent &&
          !controllerContinu.position.outOfRange) {
        setState(() {
          page++;
        });
        getPostPerPage(page);
      }
      if (controllerContinu.offset <=
              controllerContinu.position.minScrollExtent &&
          !controllerContinu.position.outOfRange) {
        print('to the top');
      }
    });
  }

  getPostPerPage(int page) async {
    var url = Uri.parse(
        'https://www.postafrique.com/wp-json/wp/v2/posts/?page=$page&per_page=100');
    http.get(url).then((value) {
      var data = json.decode(value.body);
      appState.setState(() {
        appState.listePosts.addAll(PostModel.fromJson(data));
      });
    });
  }

  getPost() async {
    await getCategorie();
    var url = Uri.parse(
        'https://www.postafrique.com/wp-json/wp/v2/posts?page=1&per_page=100');
    http.get(url).then((value) {
      var data = json.decode(value.body);
      appState.setState(() {
        appState.listePosts = PostModel.fromJson(data);
        print(appState.listePosts.length);
        appState.chargement = true;
      });
    });
  }

  getCategorie() async {
    var url = Uri.parse(
        'https://www.postafrique.com/wp-json/wp/v2/categories/?per_page=100');
    http.get(url).then((response) {
      var data = json.decode(response.body);
      appState.setState(() {
        appState.listeCategories = CategorieModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return InnerDrawer(
      key: _innerDrawerKey,
      velocity: .0,
      onTapClose: true, // default false
      swipe: true, // default trueR

      //When setting the vertical offset, be sure to use only top or bottom
      offset: IDOffset.only(bottom: 0.05, right: 0.0, left: 0.0),

      scale: IDOffset.horizontal(0.8), // set the offset in both directions

      proportionalChildArea: true, // default true
      borderRadius: 20, // default 0
      leftAnimationType: InnerDrawerAnimation.quadratic, // default static
      rightAnimationType: InnerDrawerAnimation.linear,
      backgroundDecoration: BoxDecoration(
          color: blanc), // default  Theme.of(context).backgroundColor

      //when a pointer that is in contact with the screen and moves to the right or left

      leftChild: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: blanc,
          child: Column(
            children: [
              Container(
                height: size.height,
                width: size.width * 2,
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: size.width * .45,
                      height: size.height,
                      // color: Colors.green,
                      child: Column(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () =>
                                Navigator.popAndPushNamed(context, '/'),
                            child: Container(
                                height: size.height * .06,
                                // color: Colors.black,
                                child: LayoutBuilder(
                                  builder: (context, constraints) => Row(
                                    children: [
                                      Spacer(),
                                      Icon(
                                        CupertinoIcons.home,
                                        size: constraints.maxHeight * .5,
                                        color: rouge,
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * .1,
                                      ),
                                      Container(
                                        width: constraints.maxWidth * .55,
                                        child: Text(
                                          'HOME',
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .25,
                                              color: rouge),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          GestureDetector(
                            onTap: () {
                              appState.setState(() {
                                appState.categorie = "Actualites";
                              });
                              Navigator.pushNamed(context, '/categorie');
                            },
                            child: Container(
                              height: size.height * .06,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.news,
                                      size: constraints.maxHeight * .5,
                                      color: rouge,
                                    ),
                                    SizedBox(
                                      width: constraints.maxWidth * .1,
                                    ),
                                    Container(
                                      width: constraints.maxWidth * .55,
                                      child: Text(
                                        'Actualités',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .25,
                                            color: rouge),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          GestureDetector(
                            onTap: () {
                              appState.setState(() {
                                appState.categorie = "Actu Covid-19";
                              });
                              Navigator.pushNamed(context, '/categorie');
                            },
                            child: Container(
                              height: size.height * .06,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.coronavirus,
                                      size: constraints.maxHeight * .5,
                                      color: rouge,
                                    ),
                                    SizedBox(
                                      width: constraints.maxWidth * .1,
                                    ),
                                    Container(
                                      width: constraints.maxWidth * .55,
                                      child: Text(
                                        'ACTU COVID-19',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .25,
                                            color: rouge),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          GestureDetector(
                            onTap: () {
                              appState.setState(() {
                                appState.categorie = "Tv Post Afrique";
                              });
                              Navigator.pushNamed(context, '/categorie');
                            },
                            child: Container(
                              height: size.height * .06,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.tv,
                                      size: constraints.maxHeight * .5,
                                      color: rouge,
                                    ),
                                    SizedBox(
                                      width: constraints.maxWidth * .1,
                                    ),
                                    Container(
                                      width: constraints.maxWidth * .55,
                                      child: Text(
                                        'Tv Post Afrique',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .25,
                                            color: rouge),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ), // required if rightChild is not set
      rightChild: Container(
        height: size.height,
        width: size.width,
        color: blanc,
      ),
      scaffold: Scaffold(
        appBar: AppBar(
          title: Container(
            width: size.width,
            child: Row(
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                      color: noir, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: noir,
                )
              ],
            ),
          ),
          elevation: .0,
          backgroundColor: blanc,
        ),
        backgroundColor: blanc,
        body: appState.chargement
            ? Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                  ),
                  Positioned(
                      child: Container(
                    height: size.height,
                    width: size.width,
                    // color: noir,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      controller: controllerContinu,
                      children: [
                        Container(
                          height: size.height * .45,
                          width: size.width,
                          child: Column(
                            children: [
                              Container(
                                  height: size.height * .04,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) => Row(
                                      children: [
                                        SizedBox(
                                          width: constraints.maxWidth * .03,
                                        ),
                                        Text(
                                          'LE FIL D\'ACTU'.toUpperCase(),
                                          style: TextStyle(
                                              color: rouge,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  constraints.maxHeight * .5),
                                        )
                                      ],
                                    ),
                                  )),
                              Spacer(),
                              Container(
                                height: size.height * .4,
                                width: size.width,
                                // color: rouge,
                                child: LayoutBuilder(
                                  builder: (context, constraints) => ListView(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    children: appState.listePosts
                                        .sublist(
                                          0,
                                          10,
                                        )
                                        .map((e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Container(
                                                  height: size.height * .4,
                                                  width: size.width,
                                                  child:
                                                      CardNewTop(postModel: e)),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * .05,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .03,
                              ),
                              Text(
                                'En Continu'.toUpperCase(),
                                style: TextStyle(
                                    color: rouge,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * .02),
                              )
                            ],
                          ),
                        ),
                        Container(
                          // height: size.height,
                          width: size.width,
                          child: Column(
                            children: appState.listePosts
                                .sublist(10)
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: CardNewEnContinue(postModel: e),
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              )
            : Container(
                height: size.height,
                width: size.width,
                color: blanc,
                child: Center(
                  child: CircularProgressIndicator(
                    color: rouge,
                  ),
                ),
              ),
      ),
    );
  }
}
