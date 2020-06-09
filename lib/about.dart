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
        title: BoldText("A propos", 25, Colors.white),
    centerTitle: true,
    elevation: 0.0,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
          height: 20,
          ),
          BoldText("Stay Safe",30.0,Colors.blue),
           SizedBox(
          height: 20,
          ),
           SizedBox(
          height: 10,
          ),
          Card(
            elevation: 2.0,
            child: Container(
              child:Column(children: <Widget>[
                ListTile(
                leading: Icon(Icons.info_outline,color: Colors.blue),
                title: Text("Stay safe est une application qui a pour but d'accentuer la \n"
            "lutte contre le corona virus a travers des actions de prevention comme des  \n"
            "conseils,et des informations precises et detaillés sur la maladie(onglet infos utiles)"),
                ),
                 ListTile(
                leading: Icon(Icons.dashboard,color: Colors.blue,),
                title: Text("Nom de l'application"),
                subtitle: Text("Stay Safe"),
                ),
                 ListTile(
                leading: Icon(Icons.dashboard,color: Colors.blue),
                title: Text("Version"),
                subtitle: Text("1.0"),
                ),
                ListTile(
                leading: Icon(Icons.person,color: Colors.blue),
                title: Text("Developpeur"),
                subtitle: Text("M3HEENK TECH"),
                ),
                ListTile(
                leading: Icon(Icons.contact_mail,color: Colors.blue),
                title: Text("addresse"),
                subtitle: Text("M3HEENK TECH"),
                ),
              ],)
            ),
          )
        ],
      ),
    ));
  }

  
}
