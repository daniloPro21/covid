import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/svg.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    return new FlutterMap(
      options:new MapOptions(
        center: new LatLng(80.5, -0.09),
        zoom: 13.0,
      ),
    layers: [
      new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a' , 'b' , 'c']
      ),
      new MarkerLayerOptions(
        markers: [
          new Marker(
            width: 80.0,
            height:80.0,
            point:new LatLng(80.5, -0.09),
            builder: (ctx) =>
            SvgPicture.asset("assets/Icons/marker.svg"),
          ),
        ],
      ),
    ],
    );
  }
}



  