import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/recipeDetailsPage.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolsUtilites.mainColor,
        title: Text("My Favourite Recipes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate( ToolsUtilites.imageRecipe.length ~/ 2, (index) =>
                _enwCard(pageHeight, pageWidth,  index)),
          ],
        ),
      ),
    );
  }
  Widget _enwCard(var pageHeight , var pageWidth,int index){
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsPage(),));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: pageHeight * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ToolsUtilites.mainColor,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(ToolsUtilites.imageRecipe[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: pageHeight * 0.14,
            width: double.infinity,
            color: ToolsUtilites.whoteColor,
            margin: EdgeInsets.only(left: pageHeight * 0.012),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Recipe Title",style:  TextStyle(color: ToolsUtilites.secondColor,
                  fontSize: 25,),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Row(
                   children: [
                     Icon(Icons.timer,color: ToolsUtilites.secondColor,),
                     SizedBox(width: 7,),
                     Text("60 Minutes",style:  TextStyle(color: ToolsUtilites.secondColor,
                         fontSize: 18,fontWeight: FontWeight.bold),),
                   ],
                 ),

                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Small Description for this Recipe",style:  TextStyle(color: ToolsUtilites.secondColor,
                          fontSize: 18,fontWeight: FontWeight.bold),),
                      Icon(Icons.favorite,size: 30,color: Colors.red,)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
