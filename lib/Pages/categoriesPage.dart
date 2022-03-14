import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/allRecipesPage.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ToolsUtilites.whoteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _headingCover(pageHeight,pageWidth),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.translate(
                offset: Offset(0,-pageHeight * 0.05),
                child: Container(
                  height: pageHeight * 0.60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ToolsUtilites.whoteColor,
                  ),
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      _categoryCard(pageHeight,pageWidth,"assets/images/1.png","Main"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/2.png","Breakfast"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/3.png","Sweets"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/4.png","Fast Food"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/5.png","Diet"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/6.png","Coffee"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/7.png","Salads"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/8.png","Pizza"),
                      _categoryCard(pageHeight,pageWidth,"assets/images/9.png","Asian"),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _headingCover(var pageHeight , var pageWidth){
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: pageHeight * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ToolsUtilites.secondColor,
            image: DecorationImage(
              image: NetworkImage(ToolsUtilites.imageRecipe[8]),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(ToolsUtilites.secondColor, BlendMode.hardLight),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: pageHeight * 0.1),
          child: Text("Our Categories",style:  TextStyle(color: ToolsUtilites.whoteColor,
            fontSize: 28,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget _categoryCard(var pageHeight , var pageWidth,String imageName , String imageTitle){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AllRecipesPage(imageTitle),));
        },
        child: Container(
          decoration: BoxDecoration(
              color: ToolsUtilites.mainColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(imageName,fit: BoxFit.cover,height: 80,),
              Text(imageTitle ,style: TextStyle(color: ToolsUtilites.whoteColor,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
