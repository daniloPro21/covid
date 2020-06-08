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
    mapController = MapController();

    statefulMapController = StatefulMapController(mapController: mapController);

    statefulMapController.onReady.then((_) => print("The map is ready"));

    sub = statefulMapController.changeFeed.listen((change) =>setState(() {}));

    markers = [
      //IAI Marker
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.81364,11.55838),
        builder: (ctx) => Icon(Icons.school)
      ),

      //Hospital marker

      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.86428,11.52779),
        builder: (ctx) => Icon(Icons.local_hospital,color: Colors.red,),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.86927,11.51249),
        builder: (ctx) => Icon(Icons.local_hospital,color: Colors.red,),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 80,
        width: 80,
        point: LatLng(3.87358,11.51246),
        builder: (ctx) => Icon(Icons.local_hospital,color: Colors.red,),
      ),
    ];

    getPosition();
    super.initState();
  }



  

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          pointIndex++;
          if (pointIndex >= points.length) {
            pointIndex = 0;
          }
          setState(() {
            markers[0] = Marker(
              point: points[pointIndex],
              anchorPos: AnchorPos.align(AnchorAlign.center),
              height: 30,
              width: 30,
              builder: (ctx) => Icon(Icons.pin_drop),
            );

            // one of this
            markers = List.from(markers);
            // markers = [...markers];
            // markers = []..addAll(markers);
          });
        },
      ),
      body: FlutterMap(
        options: MapOptions(
          center: points[0],
          zoom: 5,
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
            maxClusterRadius: 120,
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
                        onTap: () => debugPrint("Popup tap!"),
                        child: Text(
                          "Container popup for marker at ${marker.point}",
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
    );
  }
  

  @override
  void dispose(){
    sub.cancel();
    super.dispose();
  }
}



  