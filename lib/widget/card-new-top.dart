import 'package:flutter/material.dart';
import 'package:post_afrique/main.dart';
import 'package:post_afrique/models/post-model.dart';
import 'package:post_afrique/utils/colors-by-dii.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'
    as htmlDii;

class CardNewTop extends StatefulWidget {
  final PostModel postModel;
  const CardNewTop({Key? key, required this.postModel}) : super(key: key);

  @override
  _CardNewTopState createState() => _CardNewTopState();
}

class _CardNewTopState extends State<CardNewTop> {
  String nameCat = '';
  String date = '';
  // late DateTime dat;
  @override
  void initState() {
    setState(() {
      for (var i = 0; i < widget.postModel.categories.length; i++) {
        if (i - 1 == (widget.postModel.categories.length)) {
          setState(() {
            nameCat = appState.listeCategories
                .where((el) => el.id == widget.postModel.categories[i])
                .first
                .name;
          });
        } else {
          print(appState.listeCategories
              .where((el) => el.id == widget.postModel.categories[i])
              .length);
          setState(() {
            if (appState.listeCategories
                    .where((el) => el.id == widget.postModel.categories[i])
                    .length >
                0) {
              nameCat += appState.listeCategories
                      .where((el) => el.id == widget.postModel.categories[i])
                      .first
                      .name +
                  ' | ';
            }
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () {
          appState.setState(() {
            appState.postModel = widget.postModel;
          });
          Navigator.pushNamed(context, '/read-post');
        },
        child: Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            Positioned(
                child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth * .95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(widget.postModel.sourceUrl),
                    fit: BoxFit.fill),
              ),
            )),
            Positioned(
                bottom: constraints.maxHeight * .0,
                // left: constraints.maxWidth * .01,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        // height: constraints.maxHeight * .15,
                        width: constraints.maxWidth * .95,
                        color: noir,
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .05,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                nameCat,
                                style: TextStyle(
                                    color: blanc,
                                    fontSize: constraints.maxHeight * .05,
                                    shadows: [
                                      BoxShadow(blurRadius: 20, color: noir),
                                      BoxShadow(blurRadius: 1, color: blanc),
                                    ]),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth * .95,
                        // height: constraints.maxHeight * .2,
                        decoration: BoxDecoration(color: rouge),
                        child: Column(
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * .01,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: htmlDii.HtmlWidget(
                                widget.postModel.title,
                                textStyle: TextStyle(
                                    fontSize: constraints.maxHeight * .05,
                                    color: blanc,
                                    shadows: [
                                      BoxShadow(blurRadius: 20, color: noir),
                                      BoxShadow(blurRadius: 1, color: blanc),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: constraints.maxHeight * .01,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * .1,
                        width: constraints.maxWidth * .95,
                        // color: Colors.green,
                        child: Row(
                          children: [Spacer(), Text("")],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
