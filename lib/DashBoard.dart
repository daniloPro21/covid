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

// import 'package:geolocator/geolocator.dart';


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

    sub =statefulMapController.changeFeed.listen((change) =>setState(() {}));
    super.initState();
  }


// Future<Position> getuserposition() async
//   {

//     var geolocator = Geolocator();
//     var locationOptions =LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
//     GeolocationStatus geolocationStatus = await Geolocator().checkGeolocationPermissionStatus();

  
//        Position userPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//        return userPosition;



//       //  StreamSubscription<Position>positionStream = geolocator.getPositionStream(locationOptions).listen(
//       //   (Position userposition)
//       //   {
//       //     return(userposition == null ? 'Unknown' :userposition.latitude.toString() + ',' + userposition.longitude.toString());
//       //   }
//       // );

//       //List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(userPosition.latitude, userPosition.longitude);
//   }

  


  @override
  Widget build(BuildContext context) {

final PopupController _popupLayerConroller = PopupController();
    return new Stack(
      children: <Widget>[
          FlutterMap(
      mapController: mapController,
      options:new MapOptions(
        rotation: 1.0,
        center: new LatLng(6,6),
        zoom: 10.0,
        plugins: [
          PopupMarkerPlugin()],
          onTap:  (_) => _popupLayerConroller.hidePopup(),
      ),
    layers: [
      statefulMapController.tileLayer,
      MarkerLayerOptions(markers: statefulMapController.markers),
      //PolylineLayerOptions(polylines: statefulMapController.lines),
      //PolygonLayerOptions(polygons: statefulMapController.polygons),
      new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a' , 'b' , 'c']
      ),
      PopupMarkerLayerOptions(
        markers: [
          new Marker(
            width: 180.0,
            height:180.0,
            point:new LatLng(6,6),
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
            point:new LatLng(6.1,7.9),
            builder: (ctx) =>
           new IconButton(
              icon: Icon(Icons.person_pin_circle,color: Colors.red,),
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
    ],
    ),
    Positioned(
      top: 15.0,
      right: 15.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: TileLayersBar(controller: statefulMapController),
      ),
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

          },
          child: Icon(Icons.filter_center_focus),
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



  