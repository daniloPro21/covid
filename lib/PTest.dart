
import 'package:flutter/material.dart';
import 'package:covid/utils/TextStyles.dart';
import 'package:covid/utils/consts.dart';
import 'package:flutter_svg/svg.dart';

class PersonnalTest extends StatefulWidget {
  @override
  _PersonnalTestState createState() => _PersonnalTestState();
}

class _PersonnalTestState extends State<PersonnalTest> with SingleTickerProviderStateMixin {
  
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }




  Widget _sympCard1()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/fievre.jpg'),
          const ListTile(
            title: Text('Fievre'),
            subtitle: Text(''),
          ),
         
        ],
      ),
    );
  }

  Widget _sympCard2()
  {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Image.asset('assets/images/toux.png'),
          const ListTile(
            title: Text('Toux sèche'),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }

  Widget _sympCard3()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('La Fatigue'),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }


  Widget _toDoCard1()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Image.asset("assets/images/call.png", fit: BoxFit.contain),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Vous suspecter un des Symptômes Appelez le 1510'),
            subtitle: Text(''),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text("APPELER"),
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ],
      ),
    );
  }
    


Widget _toDoCard2()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text("En cas d'apparution des symptômes mettez vous en quarentaine en vous eloignant de vos proches \n Votre attitude est un premier pas dans la lutte contre la maladie"),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }

  Widget _toDoCard3()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset("assets/images/stayHome.svg", fit: BoxFit.contain),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text("Restons chez nous et limitons nos déplacement a l'éssentiel"),
            subtitle: Text(''),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('Consulter les zones de forte affluence'),
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _preventCard1()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Image.asset('assets/images/hands.png'),
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('Se Laver les mains'),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }
  

  Widget _preventCard2()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Image.asset('assets/images/covid.jpg'),
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('Le Port du Masque'),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }

  Widget _preventCard3()
  {
    return Card(
       elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Image.asset('assets/images/socialDistance.png'),
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('Le Respect de la distanciation Sociale'),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite,
        title: BoldText("Suivie personnel", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Scaffold(
        backgroundColor: kwhite,
        appBar: TabBar(
          labelColor: kdarkBlue,
          labelStyle:
              TextStyle(fontFamily: "nunito", fontWeight: FontWeight.bold),
          controller: tabController,
          indicatorColor: kdarkBlue,
          tabs: <Widget>[
            Tab(text: "Symptômes"),
            Tab(text: "Prevention"),
            Tab(text: "Que faire"),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
             SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   _sympCard1(),
                   _sympCard2(),
                   _sympCard3(),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   _preventCard1(),
                   _preventCard2(),
                   _preventCard3(),
                  ],
                ),
              ),
            ),
          SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   _toDoCard1(),
                   _toDoCard2(),
                   _toDoCard3(),
                  ],
                ),
              ),
            ),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
