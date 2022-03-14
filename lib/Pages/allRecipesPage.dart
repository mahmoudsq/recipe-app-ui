import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/recipeDetailsPage.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';

class AllRecipesPage extends StatefulWidget {
  final String headTitle;

  const AllRecipesPage( this.headTitle) ;

  @override
  _AllRecipesPageState createState() => _AllRecipesPageState();
}

class _AllRecipesPageState extends State<AllRecipesPage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolsUtilites.mainColor,
        title: Text(widget.headTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                ...List.generate(ToolsUtilites.imageRecipe.length, (index) =>
                _featureCard(pageHeight, pageWidth, index)),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _featureCard(var pageHeight , var pageWidth,int index){
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsPage(),));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: pageHeight * 0.25,
              width: pageWidth * 0.45,
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
              height: pageHeight * 0.25,
              width: pageWidth * 0.45,
              decoration: BoxDecoration(
                color: ToolsUtilites.secondColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5,bottom: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("The Recipe Title",style:  TextStyle(color: ToolsUtilites.whoteColor,
                      fontSize: 22,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("Category",style:  TextStyle(color: ToolsUtilites.whoteColor,
                              fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.favorite,color: (index % 2 == 0) ? Colors.redAccent : ToolsUtilites.whoteColor,size: 30,),
                        ),
                       // SizedBox(width: 0,),
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
}
