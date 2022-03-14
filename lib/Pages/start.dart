import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:recipe_app/Pages/allRecipesPage.dart';
import 'package:recipe_app/Pages/categoriesPage.dart';
import 'package:recipe_app/Pages/favouritePage.dart';
import 'package:recipe_app/Pages/home.dart';
import 'package:recipe_app/Pages/infoPage.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _page = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    List<Widget> tabs = [
      InfoPage(),
      CategoriesPage(),
      HomePage(),
      AllRecipesPage("All Recipes"),
      FavouritePage()
    ];

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
       // height: 50.0,
        items: [
          Icon(Icons.info, size: 30,color: ToolsUtilites.whoteColor,),
          Icon(Icons.calendar_view_day, size: 30,color: ToolsUtilites.whoteColor),
          Icon(Icons.whatshot, size: 30,color: ToolsUtilites.whoteColor),
          Icon(Icons.receipt, size: 30,color: ToolsUtilites.whoteColor),
          Icon(Icons.favorite, size: 30,color: ToolsUtilites.whoteColor),
        ],
        color: ToolsUtilites.mainColor,
        //buttonBackgroundColor: ToolsUtilites.mainColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        //animationDuration: Duration(milliseconds: 600),
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
      ),
      body: tabs[_page],
    );
  }
}
