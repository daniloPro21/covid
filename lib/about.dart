import 'package:flutter/material.dart';
import 'package:covid/utils/TextStyles.dart';
import 'package:covid/utils/consts.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: BoldText("Notifications", 25, Colors.white),
    centerTitle: true,
    elevation: 0.0,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Text("Stay safe est une application qui a pour but d'accentuer la \n"
            "lutte contre le corona virus a travers des actions de prevention comme des  \n"
            "conseils,et des informations precises et detaillés sur la maladie(onglet infos utiles)"),
          ),
          Card(
            elevation: 2.0,
            child: Container(
              child: ListTile(title: Text(""),),
            ),
          )
        ],
      ),
    ));
  }

  
}
