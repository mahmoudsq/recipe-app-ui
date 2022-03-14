import 'package:flutter/material.dart';
import 'package:recipe_app/Utilites/toolsutilites.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    TextEditingController _nameTextControl = TextEditingController();
    return Scaffold(
      backgroundColor: ToolsUtilites.whoteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headingCover(pageHeight, pageWidth),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text("We Here For You" ,style: TextStyle(color: ToolsUtilites.secondColor , fontWeight: FontWeight.bold,fontSize: pageWidth * 0.07),),
              ),
            ),
            _infoCard(pageHeight, pageWidth,ToolsUtilites.loremLong,"Our Vision",4),
            _infoCard(pageHeight, pageWidth,ToolsUtilites.loremLong,"Our Mission",7),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Text("Contact Us" ,style: TextStyle(color: ToolsUtilites.mainColor , fontWeight: FontWeight.bold,fontSize: pageWidth * 0.06),),
            ),
            _customTextFiled(1,_nameTextControl,"Enter Your Name"),
            _customTextFiled(1,_nameTextControl,"Enter Your Phone Number"),
            _customTextFiled(1,_nameTextControl,"Enter Your Message Title"),
            _customTextFiled(3,_nameTextControl,"Enter Your Message Content"),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: ToolsUtilites.mainColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: FlatButton.icon(onPressed: () {},
                      icon: Icon(Icons.email,color: ToolsUtilites.whoteColor,),
                      label: Text("Send Via Email",style: TextStyle(color: ToolsUtilites.whoteColor,fontSize: 18),)),
                ),
              ),
            ),
            _socialMediaItems(pageHeight, pageWidth),
          ],
        ),
      ),
    );
  }
  Widget _headingCover(var pageHeight , var pageWidth){
    return Stack(
      children: [
        Container(
          height: pageHeight * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ToolsUtilites.mainColor,
            image: DecorationImage(
              image: NetworkImage(ToolsUtilites.imageRecipe[3]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: pageHeight * 0.18,left: pageWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("About Our Recipe Community",style:  TextStyle(color: ToolsUtilites.whoteColor,
                fontSize: 35, fontWeight: FontWeight.bold),),

            ],
          ),
        )
      ],
    );
  }

  Widget _infoCard(var pageHeight , var pageWidth,String infoParagraph,String title , int imageIndex){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
           padding: const EdgeInsets.only(left: 9),
           child: Text(title ,style: TextStyle(color: ToolsUtilites.mainColor , fontWeight: FontWeight.bold,fontSize: pageWidth * 0.06),),
         ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(ToolsUtilites.imageRecipe[imageIndex],height: pageHeight * 0.2,width: double.infinity,fit: BoxFit.cover,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(infoParagraph,style: TextStyle(color: ToolsUtilites.secondColor ,fontSize: pageWidth * 0.04,),textAlign: TextAlign.justify,),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _customTextFiled(int maxLine , TextEditingController controller,hintName){
    return Padding(
      padding: EdgeInsets.only(bottom: 10,left: 20,right: 20),
      child: TextField(
        maxLines: maxLine,
        controller: controller,
        decoration: InputDecoration(
          hoverColor: ToolsUtilites.secondColor,
          focusColor: ToolsUtilites.secondColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ToolsUtilites.secondColor
            )
          ),
          labelText: hintName,
          labelStyle: TextStyle(
            color: ToolsUtilites.secondColor,
            fontSize: 15,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }

  Widget _socialMediaItems(var pageHeight , var pageWidth){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Text("Follow Us" ,style: TextStyle(color: ToolsUtilites.mainColor , fontWeight: FontWeight.bold,fontSize: pageWidth * 0.06),),
        ),
        Padding(
          padding: const EdgeInsets.only(top:10,bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(FontAwesomeIcons.facebook,color: ToolsUtilites.secondColor,),
              Icon(FontAwesomeIcons.twitter,color: ToolsUtilites.secondColor,),
              Icon(FontAwesomeIcons.instagram,color: ToolsUtilites.secondColor,),
              Icon(FontAwesomeIcons.pinterest,color: ToolsUtilites.secondColor,),
              Icon(FontAwesomeIcons.youtube,color: ToolsUtilites.secondColor,),
              Icon(FontAwesomeIcons.globe,color: ToolsUtilites.secondColor,),
              Icon(FontAwesomeIcons.snapchat,color: ToolsUtilites.secondColor,),
            ],
          ),
        )
      ],
    );
  }

}
