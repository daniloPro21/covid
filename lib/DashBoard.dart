import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:map_controller/map_controller.dart';
import 'dart:async';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:covid/core/locationService.dart';




class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

  

}

class _DashboardState extends State<Dashboard> {

  MapController mapController;
  StatefulMapController statefulMapController;
  StreamSubscription<StatefulMapControllerStateChange> sub;

  final PopupController _popupController = PopupController();

  List<Marker> markers;
  int pointIndex;
  List points = [
    LatLng(51.5, -0.09),
    LatLng(49.8566, 3.3522),
  ];




  
  @override
  void initState()
  {
    getPosition();

   

    mapController = MapController();

    statefulMapController = StatefulMapController(mapController: mapController);

    statefulMapController.onReady.then((_) => print("The map is ready"));

    sub = statefulMapController.changeFeed.listen((change) =>setState(() {}));

  
    super.initState();
  }


Future<String> futureLocationData = getPosition();

  

 @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: FutureBuilder<String>(
        future: futureLocationData,
        builder: (context , snapshot)
        {
          if(snapshot.hasData)
          {

            markers = [

      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(userCurrentlat,userCurrentlong),
        builder: (ctx) => Icon(Icons.person_pin_circle,color: Colors.blue,size: 35,)
      ),

      //IAI Marker
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.81364,11.55838),
        builder: (ctx) => Icon(Icons.school)
      ),

      //Centre de priise en charge

      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.86428,11.52779),
        builder: (ctx) => Icon(Icons.security,color: Colors.red,),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.86927,11.51249),
        builder: (ctx) => Icon(Icons.security,color: Colors.red,),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.87358,11.51246),
        builder: (ctx) => Icon(Icons.security,color: Colors.red,),
      ),

   Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.85510,11.50901),
        builder: (ctx) => Icon(Icons.security,color: Colors.red,),
      ),

       Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.87055,11.50996),
        builder: (ctx) => Icon(Icons.security,color: Colors.red,),
      ),

       Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(4.06481,9.75829),
        builder: (ctx) => Icon(Icons.security,color: Colors.red,),
      ),

// Point d'eau

 Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.86489,11.52162),
        builder: (ctx) => Icon(Icons.local_drink,color: Colors.blue,),
      ),
      
//depistage

 Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.89120,11.50042),
        builder: (ctx) => Icon(Icons.lightbulb_outline,color: Colors.green,),
      ),


    ];

            
            return Stack(children: <Widget>[
              FlutterMap(
        options: MapOptions(
          center: LatLng(userCurrentlat,userCurrentlong),
          zoom: 15,
          plugins: [
            MarkerClusterPlugin(),
          ],
          onTap: (_) => _popupController
              .hidePopup(), // Hide popup when the map is tapped.
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 50,
            size: Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
                popupSnap: PopupSnap.top,
                popupController: _popupController,
                popupBuilder: (_, marker) => Container(
                      width: 200,
                      height: 100,
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                         
                        },
                        child: Text(
                          "Container popup for marker at ${marker.point} ",
                        ),
                      ),
                    )),
            builder: (context, markers) {
              return FloatingActionButton(
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          ),
        ],
      ),
      Positioned(
      bottom: 80.0,
      right: 15.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: FloatingActionButton(
          elevation: 3.0,
          backgroundColor: Colors.blue,

          onPressed: (){ 


            //fonction permettant de centrer la map sur la position de l'utilisateur
            print('map centered to user location');
          },
          child: Icon(Icons.person_pin_circle),
        ),
      ),
    ),
    Positioned(
      top: 180.0,
      right: 15.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: FloatingActionButton(
          elevation: 3.0,
          backgroundColor: Colors.blue,

          onPressed: (){ //affiche la legende de la carte dans un bottom sheet
            showModalBottomSheet(context: context,
            isScrollControlled: true,
             builder: (BuildContext context)
            {
              return Container(
                height: 285,
                color: Colors.white10,
                child: Center(
                  child: Column(children: <Widget>[
                      Text("Legende"),
                      SizedBox(height: 1,),
                       ListTile(leading: Icon(Icons.person_pin_circle,color:Colors.blue),
                    title: Text("Votre position"),
                    ),
                    ListTile(leading: Icon(Icons.security,color:Colors.red),
                    title: Text("Centre specialisé dans la prise en charge de patient atteint de la maladie"),
                    ),
                     ListTile(leading: Icon(Icons.local_drink,color:Colors.blue),
                    title: Text("Point d'eau pour lavage de mains"),
                    ),
                     ListTile(leading: Icon(Icons.lightbulb_outline,color:Colors.green),
                    title: Text("Point de depistage"),
                    )
                  ],
                  ),
                ),
              );
            }
            );
          },
          child: Text('L'),
        ),
      ),
    ),
            ],
            );
          }
          else if(snapshot.hasError)
          {
            throw Exception("Erreur de chargement de la carte");
          }

          return  Center(child: 
          Column(children: <Widget>[
            SizedBox(height: 60,),
            CircularProgressIndicator(),
            Text('Activez la localisation pour pouvoir afficher la carte')
          ],)
          ,);
        },
      )
    );
  }
  

  @override
  void dispose(){
    sub.cancel();
    super.dispose();
  }
}



  