import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/videoPlayer.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';

class RecipeDetailsPage extends StatefulWidget {
  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ToolsUtilites.mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _headingCover(pageHeight, pageWidth),
            _contentHead(pageHeight, pageWidth),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: ToolsUtilites.whoteColor,
                height: 5,
              ),
            ),
            _tabBarContent(pageHeight, pageWidth),
          ],
        ),
      ),
    );
  }

  Widget _headingCover(var pageHeight, var pageWidth) {
    return Stack(
      children: [
        Container(
          height: pageHeight * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ToolsUtilites.secondColor,
            image: DecorationImage(
              image: NetworkImage(ToolsUtilites.imageRecipe[8]),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  ToolsUtilites.secondColor, BlendMode.hardLight),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Icon(
                Icons.favorite,
                color: ToolsUtilites.whoteColor,
                size: 30,
              ),
            )
          ],
          shadowColor: Colors.transparent,
        ),
        Transform.translate(
          offset: Offset(pageWidth * 0.25, pageHeight * 0.22),
          child: Text(
            "The Recipe Title",
            style: TextStyle(
                color: ToolsUtilites.whoteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _contentHead(var pageHeight, var pageWidth) {
    return Padding(
      padding: EdgeInsets.only(top: (pageHeight * 0.04)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                Icons.timer,
                color: ToolsUtilites.whoteColor,
                size: 35,
              ),
              Text(
                "60 Mins",
                style: TextStyle(
                    color: ToolsUtilites.whoteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.people,
                color: ToolsUtilites.whoteColor,
                size: 35,
              ),
              Text(
                "4 People",
                style: TextStyle(
                    color: ToolsUtilites.whoteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.room_service,
                color: ToolsUtilites.whoteColor,
                size: 35,
              ),
              Text(
                "40 Mins",
                style: TextStyle(
                    color: ToolsUtilites.whoteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tabBarContent(var pageHeight, var pageWidth) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            indicatorColor: ToolsUtilites.whoteColor,
            physics: ScrollPhysics(),
            tabs: [
              Tab(
                text: "Description",
                icon: Icon(
                  Icons.description,
                  size: 35,
                ),
              ),
              Tab(
                text: "Integrations",
                icon: Icon(
                  Icons.fastfood,
                  size: 35,
                ),
              ),
              Tab(
                text: "Video",
                icon: Icon(
                  Icons.videocam,
                  size: 35,
                ),
              ),
            ]),
        Container(
          height: pageHeight * 0.45,
          child: TabBarView(
            controller: _tabController,
            physics: ScrollPhysics(),
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ToolsUtilites.whoteColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Let's Cooking",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: ToolsUtilites.mainColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              ToolsUtilites.loremLong + ToolsUtilites.loremLong,
                              style: TextStyle(
                                  color: ToolsUtilites.secondColor,
                                  fontSize: 15),
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ToolsUtilites.whoteColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You Will Need:",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: ToolsUtilites.mainColor),
                            ),
                            SizedBox(
                              height: pageHeight * 0.04,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: ToolsUtilites.mainColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  ToolsUtilites.loremLong,
                                  style: TextStyle(
                                      color: ToolsUtilites.whoteColor,
                                      fontSize: 20),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VideoApp(),));
                },
                child: Container(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: pageHeight * 0.40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ToolsUtilites.secondColor,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(ToolsUtilites.imageRecipe[8]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  ToolsUtilites.secondColor, BlendMode.hardLight),
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.play_circle_outline,size: pageHeight * 0.15,color: ToolsUtilites.whoteColor,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
