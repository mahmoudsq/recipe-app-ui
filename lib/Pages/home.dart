import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/recipeDetailsPage.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ToolsUtilites.whoteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headingCover(pageHeight,pageWidth),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Featured Recipes",
                style: TextStyle(color: ToolsUtilites.secondColor,fontWeight: FontWeight.bold,fontSize: 25),),
            ),
            Container(
              height: pageHeight * 0.4,
              child: ListView.builder(
                itemCount: ToolsUtilites.imageRecipe.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _featureCard(pageHeight,pageWidth,index);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("New",
                style: TextStyle(color: ToolsUtilites.secondColor,fontWeight: FontWeight.bold,fontSize: 25),),
            ),
            Container(
              height: pageHeight * 0.3,
              margin: EdgeInsets.only(bottom: pageHeight * 0.05),
              child: ListView.builder(
                itemCount: ToolsUtilites.imageRecipe.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _enwCard(pageHeight,pageWidth,index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headingCover(var pageHeight , var pageWidth){
    return Stack(
      children: [
        Container(
          height: pageHeight * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ToolsUtilites.mainColor,
            image: DecorationImage(
              image: NetworkImage(ToolsUtilites.imageRecipe[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: pageHeight * 0.1,left: pageWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Daily New Recipe",style:  TextStyle(color: ToolsUtilites.whoteColor,
                fontSize: 20,),),
              Text("Discovery Now",style:  TextStyle(color: ToolsUtilites.whoteColor,
                  fontSize: 35,fontWeight: FontWeight.bold),)
            ],
          ),
        )
      ],
    );
  }

  Widget _featureCard(var pageHeight , var pageWidth,int index){
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
              height: pageHeight * 0.4,
              width: pageWidth * 0.5,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: pageHeight * 0.4,
              width: pageWidth * 0.5,
              decoration: BoxDecoration(
                  color: ToolsUtilites.secondColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8,bottom: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Recipe Title",style:  TextStyle(color: ToolsUtilites.whoteColor,
                      fontSize: 22,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Icon(Icons.restaurant,color: ToolsUtilites.whoteColor,),
                        SizedBox(width: 5,),
                        Text("Category",style:  TextStyle(color: ToolsUtilites.whoteColor,
                            fontSize: 18,fontWeight: FontWeight.bold),),

                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
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
              height: pageHeight * 0.3,
              width: pageWidth * 0.8,
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
            height: pageHeight * 0.1,
            width: pageWidth * 0.8,
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
                    Icon(Icons.timer,color: ToolsUtilites.secondColor,),
                    SizedBox(width: 7,),
                    Text("60 Minutes",style:  TextStyle(color: ToolsUtilites.secondColor,
                        fontSize: 18,fontWeight: FontWeight.bold),),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

