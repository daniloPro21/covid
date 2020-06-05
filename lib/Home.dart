import 'package:covid/stats.dart';
import 'package:flutter/material.dart';
import 'package:covid/Notifications.dart';
import 'package:covid/Orders.dart';
import 'package:covid/Dashboard.dart';
import 'package:covid/PTest.dart';
import 'dart:async';




class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  int _selectedIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _incrementTab(index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

 
  



  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Stay Safe"),
        actions: <Widget>[
          IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
          ),
        ],
      ),
      drawer: _Slider(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
       onTap: _incrementTab,
       selectedItemColor: Colors.blue,
       unselectedItemColor: Colors.grey,
       
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.show_chart),
            title: Text("Statistiques"),
          
          ),
           BottomNavigationBarItem(
            icon: Icon( Icons.info),
            title: Text("Infos utiles"),
            
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.map),
            title: Text("carte"),
            
          ),
           BottomNavigationBarItem(
            icon: Icon( Icons.person_outline),
            title: Text("Suivie personnel"),
            
          ),
    
     ],
    ),
    body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => index = index);
          },
          children: <Widget>[
            Stats(), //pafe d'acceuil
            Orders(),  //la page d'infos
            Dashboard(), // la carte
            PersonnalTest() // suivie personnel sur les possible symptomes presenté
          ],
        ),
      ),
     
    );
  }
}







Widget _Slider()
{
  final author =Text('by M3HEENK TECH',
  textAlign: TextAlign.center,
  style: 
          TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic
          )
          );
          
  return Drawer(
    elevation: 5,
    child: Container(
      color: Colors.blue,
      child: 
    ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: null,
          currentAccountPicture: null,
          accountName: null,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/second.jpg",),
            )
          ),
        ),
        ListTile(
          leading: Icon(Icons.show_chart,color: Colors.white),
          title: Text("Statistiques",style: 
          TextStyle(
            color: Colors.white
          ),),
        ),
        ListTile(
          leading: Icon(Icons.info,color: Colors.white),
          title: Text("Informations utiles",style: 
          TextStyle(
            color: Colors.white
          ),),
        ),
       ListTile(
          leading: Icon(Icons.map,color: Colors.white),
          title: Text("Zones d'affluence",style: 
          TextStyle(
            color: Colors.white
          ),),
        ),
        ListTile(
          leading: Icon(Icons.person_outline,color: Colors.white),
          title: Text("Mon suivie personnel",style: 
          TextStyle(
            color: Colors.white
          ),),
        ),
        ListTile(
          leading: Icon(Icons.help,color: Colors.white),
          title: Text("A propos",style: 
          TextStyle(
            color: Colors.white
          ),),
        ),
        ListTile(
          leading: Icon(Icons.settings,color: Colors.white),
          title: Text("Parametres",style: 
          TextStyle(
            color: Colors.white
          ),),
        ),
        Divider(color: Colors.white,),
        Text("Stay Safe",
        textAlign: TextAlign.center,
        style: 
          TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),),
          author,
      ],
    ),
    )
  );
}





