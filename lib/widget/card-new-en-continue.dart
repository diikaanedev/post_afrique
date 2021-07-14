import 'package:flutter/material.dart';
import 'package:post_afrique/main.dart';
import 'package:post_afrique/models/post-model.dart';
import 'package:post_afrique/utils/colors-by-dii.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'
    as htmlDii;

class CardNewEnContinue extends StatefulWidget {
  final PostModel postModel;
  const CardNewEnContinue({Key? key, required this.postModel})
      : super(key: key);

  @override
  _CardNewEnContinueState createState() => _CardNewEnContinueState();
}

class _CardNewEnContinueState extends State<CardNewEnContinue> {
  String nameCat = '';
  @override
  void initState() {
    setState(() {
      nameCat = appState.listeCategories
                  .where((element) =>
                      element.id == widget.postModel.categories.first)
                  .length >
              0
          ? appState.listeCategories
              .where(
                  (element) => element.id == widget.postModel.categories.first)
              .first
              .name
          : "Pas de Categorie";
      // Timestamp timestamp = widget.postModel.date;
      // dat = new DateTime.fromMicrosecondsSinceEpoch(
      //     timestamp.millisecondsSinceEpoch * 1000);
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
                left: constraints.maxWidth * .01,
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.postModel.sourceUrl),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(4)),
                )),
            Positioned(
                left: constraints.maxWidth * .32,
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .65,
                  decoration: BoxDecoration(
                      color: rouge, borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .15,
                        // color: noir,
                        width: constraints.maxWidth * .6,
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              width: constraints.maxWidth * .6,
                              child: Text(
                                nameCat,
                                style: TextStyle(
                                  fontSize: constraints.maxHeight * .1,
                                  color: noir,
                                ),
                              ),
                            ),
                            // Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .6,
                        // color: noir,
                        width: constraints.maxWidth * .6,
                        child: Column(
                          children: [
                            // Spacer(),
                            htmlDii.HtmlWidget(
                              widget.postModel.title,
                              textStyle: TextStyle(
                                fontSize: constraints.maxHeight * .08,
                                fontWeight: FontWeight.bold,
                                color: blanc,
                              ),
                            ),

                            Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
