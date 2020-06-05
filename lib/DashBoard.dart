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



  
  @override
  void initState()
  {
    mapController = MapController();
    statefulMapController = StatefulMapController(mapController: mapController);

    statefulMapController.onReady.then((_) => print("The map is ready"));

    sub = statefulMapController.changeFeed.listen((change) =>setState(() {}));

    getPosition();
    super.initState();
  }



  


  @override
  Widget build(BuildContext context) {

final PopupController _popupLayerConroller = PopupController();
    return new Stack(
      children: <Widget>[
          FlutterMap(
      mapController: mapController,
      options:new MapOptions(
        rotation: 1.0,
        //center: LatLng(lat,long),
        zoom: 10.0,
        interactive: true,
        plugins: [
          PopupMarkerPlugin()],
          onTap:  (_) => _popupLayerConroller.hidePopup(),
      ),
    layers: [
      statefulMapController.tileLayer,
      MarkerLayerOptions(markers: statefulMapController.markers),
      PolylineLayerOptions(polylines: statefulMapController.lines),
      PolygonLayerOptions(polygons: statefulMapController.polygons),
      new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a' , 'b' , 'c']
      ),
      PopupMarkerLayerOptions(
        markers: [
          new Marker(
            width: 180.0,
            height:180.0,
            point:new LatLng(lat,long),
            builder: (ctx) =>
            new IconButton(
              icon: Icon(Icons.person_pin_circle,color: Colors.blue),
            )
          ),
           new Marker(
            width: 80.0,
            height:80.0,
            point:new LatLng(6.1,6.9),
            builder: (ctx) =>
           new IconButton(
              icon: Icon(Icons.person_pin_circle,color: Colors.red,),
            )
          ),
           new Marker(
            width: 80.0,
            height:80.0,
            point:new LatLng(6,7.9),
            builder: (ctx) =>
           new IconButton(
              icon: Icon(Icons.person_pin_circle,color: Colors.red,),
            )
          ),
          new Marker(
            width: 80.0,
            height:80.0,
            point:new LatLng(6,13),
            builder: (ctx) =>
           new IconButton(
              icon: Icon(Icons.person_pin_circle,color: Colors.green,),
            )
          ),
          new Marker(
            width: 80.0,
            height:80.0,
            point:new LatLng(6,7.9),
            builder: (ctx) =>
           new IconButton(
              icon: Icon(Icons.person_pin_circle,color: Colors.green,),
            )
          ),
        ],
      popupSnap: PopupSnap.top,
      popupController: _popupLayerConroller,
      popupBuilder: (BuildContext _, Marker marker) => 
      Card(
        elevation: 5.0,
        child: Container(
          height: 120,
          width: 200,
          color: Colors.white,
          child:  ListTile(
            leading: Icon(Icons.pin_drop,color: Colors.blue,),
            title: Text("Restons chez nous et limitons nos déplacement a l'éssentiel"),
            subtitle: Text(''),
          )
        ),
      ),
      ),
      CircleLayerOptions(
        circles: [
          new CircleMarker(
            point: LatLng(lat, long),
            color: Colors.blue.withOpacity(0.2),
            borderStrokeWidth: 2.0,
            borderColor: Colors.blue,
            radius: 30
          )
        ]
      )
    ],
    ),
    // Positioned(
    //   top: 15.0,
    //   right: 15.0,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.black,
    //       borderRadius: BorderRadius.circular(10.0)
    //     ),
    //     child: TileLayersBar(controller: statefulMapController),
    //   ),
    // ),
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

          onPressed: (){ //fonction permettant de centrer la map sur la position de l'utilisateur
            statefulMapController.mapController.move(LatLng(lat, long),10.0);
            print('map centered to user location');
          },
          child: Icon(Icons.filter_center_focus),
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

          onPressed: (){ //fonction permettant de centrer la map sur la position de l'utilisateur
            
          },
          child: Text('L'),
        ),
      ),
    )
      ],
    );
    
  }

  

  @override
  void dispose(){
    sub.cancel();
    super.dispose();
  }
}



  