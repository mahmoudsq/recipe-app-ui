import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/home.dart';
import 'package:recipe_app/Pages/start.dart';
import 'package:recipe_app/Utilites/onBoardingModel.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  bool atEnd = false;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: PageView.builder(
            itemCount: slideData.length,
            controller: _pageController,
            onPageChanged: (value) {
              print(value);
              if (value == (slideData.length - 1)) {
                setState(() {
                  atEnd = true;
                  currentIndex = value;
                });
              } else {
                setState(() {
                  atEnd = false;
                  currentIndex = value;
                });
              }
            },
            itemBuilder: (context, index) {
              return Scaffold(
                backgroundColor: ToolsUtilites.mainColor,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.transparent,
                      child: atEnd
                          ? InkWell(
                              child: Text(
                                "Go To Home",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ToolsUtilites.whoteColor),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StartPage(),
                                    ));
                              },
                            )
                          : InkWell(
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ToolsUtilites.whoteColor),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StartPage(),
                                    ));
                              },
                            ),
                      elevation: 0,
                    )
                  ],
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _slideImage(),
                    _headLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _drawDots(slideData.length),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _slideImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
            color: ToolsUtilites.whoteColor,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: ExactAssetImage(slideData[currentIndex].image),
            )),
      ),
    );
  }

  Widget _headLine() {
    return Text(
      slideData[currentIndex].title,
      style: TextStyle(
          color: ToolsUtilites.whoteColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
  }

  List<Widget> _drawDots(int length) {
    List<Widget> widgets = [];
    for (int i = 0; i < length; i++) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: (i == currentIndex)
                  ? ToolsUtilites.secondColor
                  : ToolsUtilites.whoteColor),
        ),
      ));
    }
    return widgets;
  }
}

List<OnBoardingModel> slideData = [
  OnBoardingModel("assets/images/45929.png", "First Title"),
  OnBoardingModel("assets/images/3941071.png", "Second Title"),
  OnBoardingModel(
      "assets/images/man-chef-cooking-cartoon-illustration_138676-2048.png",
      "Third Title"),
];
