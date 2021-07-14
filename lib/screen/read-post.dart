import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:post_afrique/main.dart';
import 'package:post_afrique/utils/colors-by-dii.dart';
import 'package:post_afrique/widget/card-new-top.dart';

class ReadPost extends StatefulWidget {
  const ReadPost({Key? key}) : super(key: key);

  @override
  _ReadPostState createState() => _ReadPostState();
}

class _ReadPostState extends State<ReadPost> {
  late Size size;

  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  // late ScrollController controllerContinu;

  // int page = 0;
  String nameCat = '';
  @override
  void initState() {
    super.initState();

    appState.postModel.categories.forEach((element) {
      nameCat += '// ' +
          appState.listeCategories.where((el) => el.id == element).first.name +
          ' ';
    });

    // nameCat = appState.listeCategories
    //             .where((element) =>
    //                 element.id == appState.postModel.categories.first)
    //             .length >
    //         0
    //     ? appState.listeCategories
    //         .where(
    //             (element) => element.id == appState.postModel.categories.first)
    //         .first
    //         .name
    //     : "Pas de Categorie";
    //   setState(() {
    //     controllerContinu = ScrollController();
    //   });
    //   getPost();
    //   controllerContinu.addListener(() {
    //     if (controllerContinu.offset >=
    //             controllerContinu.position.maxScrollExtent &&
    //         !controllerContinu.position.outOfRange) {
    //       setState(() {
    //         page++;
    //       });
    //       getPostPerPage(page);
    //     }
    //     if (controllerContinu.offset <=
    //             controllerContinu.position.minScrollExtent &&
    //         !controllerContinu.position.outOfRange) {
    //       print('to the top');
    //     }
    //   });
  }

  // getPostPerPage(int page) async {
  //   var url = Uri.parse(
  //       'https://www.postafrique.com/wp-json/wp/v2/posts/?page=$page');
  //   http.get(url).then((value) {
  //     var data = json.decode(value.body);
  //     appState.setState(() {
  //       appState.listePosts.addAll(PostModel.fromJson(data));
  //     });
  //   });
  // }

  // getPost() async {
  //   await getCategorie();
  //   var url = Uri.parse('https://www.postafrique.com/wp-json/wp/v2/posts');
  //   http.get(url).then((value) {
  //     var data = json.decode(value.body);
  //     appState.setState(() {
  //       appState.listePosts = PostModel.fromJson(data);
  //       print(appState.listePosts.length);
  //       appState.chargement = true;
  //     });
  //   });
  // }

  // getCategorie() async {
  //   var url = Uri.parse('https://www.postafrique.com/wp-json/wp/v2/categories');
  //   http.get(url).then((response) {
  //     var data = json.decode(response.body);
  //     appState.setState(() {
  //       appState.listeCategories = CategorieModel.fromJson(data);
  //     });
  //   });
  // }

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
      ),

      /// required if rightChild is not set
      rightChild: Container(
        height: size.height,
        width: size.width,
        color: blanc,
      ),
      scaffold: Scaffold(
        appBar: AppBar(
          toolbarHeight: .0,
          leading: Container(
            // color: rouge,
            width: size.width,
            child: Row(
              children: [
                Spacer(),
                Icon(
                  Icons.arrow_back,
                  color: noir,
                ),
                Spacer(),
              ],
            ),
          ),
          title: Container(
            width: size.width,
            child: Row(
              children: [
                Text(
                  'Article',
                  style: TextStyle(
                      color: noir, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: noir,
                ),
                SizedBox(
                  width: 8,
                ),
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
                    // height: size.height,
                    width: size.width,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Container(
                        height: constraint.maxHeight,
                        width: constraint.maxWidth,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Container(
                              height: constraint.maxHeight * .4,
                              width: size.width,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      height: constraint.maxHeight * .05,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Icon(
                                            Icons.arrow_back,
                                            color: noir,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          appState.postModel.sourceUrl),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: blanc,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            nameCat,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: rouge),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: HtmlWidget(
                                        appState.postModel.title,
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: noir),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * .05,
                                        ),
                                        HtmlWidget(
                                          appState.postModel.content,
                                          webView: true,
                                          webViewJs: true,
                                          textStyle: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: size.height * .05,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: constraint.maxWidth,
                                      color: noir,
                                      height: .5,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: size.height * .05,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * .03,
                                          ),
                                          Text(
                                            'Autres Articles '.toUpperCase(),
                                            style: TextStyle(
                                                color: rouge,
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.height * .02),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: constraint.maxHeight * .45,
                                      width: constraint.maxWidth,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        children: appState.listePosts
                                            .where((element) =>
                                                element.categories.first ==
                                                appState
                                                    .postModel.categories.first)
                                            .map((e) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Container(
                                                      height:
                                                          constraint.maxHeight *
                                                              .4,
                                                      width:
                                                          constraint.maxWidth,
                                                      child: CardNewTop(
                                                          postModel: e)),
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraint.maxHeight * .02,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  )),
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
