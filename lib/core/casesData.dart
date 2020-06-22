
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'notificationsService.dart';

final url = 'http://corona-api.com/countries/CM';
var data;


Future<String> fetchCasesData() async {
  final response = await http.get(

    Uri.encodeFull(url),
    headers:  {"accepts" : "application/json"}

      );


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

     var toJson = jsonDecode(response.body);
      data = toJson['data'];

      print(data);

     

    return "ok";
   
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Chargement de données impossible ou pas de connexion internet');
  }
}

// Positioned(
//       bottom: 80.0,
//       right: 15.0,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0)
//         ),
//         child: FloatingActionButton(
//           elevation: 3.0,
//           backgroundColor: Colors.blue,

//           onPressed: (){ //fonction permettant de centrer la map sur la position de l'utilisateur
//             statefulMapController.mapController.move(LatLng(userCurrentlat,userCurrentlong), 11.0);
//             print('map centered to user location');
//           },
//           child: Icon(Icons.filter_center_focus),
//         ),
//       ),
//     ),
//     Positioned(
//       top: 180.0,
//       right: 15.0,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0)
//         ),
//         child: FloatingActionButton(
//           elevation: 3.0,
//           backgroundColor: Colors.blue,

//           onPressed: (){ //affiche la legende de la carte dans un bottom sheet
//             showModalBottomSheet(context: context,
//             isScrollControlled: true,
//              builder: (BuildContext context)
//             {
//               return Container(
//                 height: 185,
//                 child: Center(
//                   child: Column(children: <Widget>[
//                     Text("FG")
//                   ],),
//                 ),
//               );
//             }
//             );
//           },
//           child: Text('L'),
//         ),
//       ),
//     ),


// @override
//   Widget build(BuildContext context) {

// final PopupController _popupController = PopupController();

// final currentUserMarker =  new Marker(
//             width: 80.0,
//             height: 80.0,
//             point: new LatLng(userCurrentlat,userCurrentlong),
//             builder: (ctx) => Icon(Icons.person_pin_circle,color: Colors.blue,),
//             );

//     return  
//     Stack(
//       children: <Widget>[
//         FlutterMap(
//     options: new MapOptions(
//       center: new LatLng(userCurrentlat,userCurrentlong),
//       zoom: 10.0,
//        plugins: [
//             MarkerClusterPlugin(),
//             PopupMarkerPlugin()
//           ],
//           onTap: (_) =>_popupController
//               .hidePopup(), // Hide popup when the map is tapped.
//     ),
//     layers: [
//       statefulMapController.tileLayer,
//       new TileLayerOptions(
//         urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//         subdomains: ['a', 'b', 'c'],
        
//       ),
//       new MarkerClusterLayerOptions(
//             maxClusterRadius: 50,
//             size: Size(40, 40),
//             anchor: AnchorPos.align(AnchorAlign.center),
//             fitBoundsOptions: FitBoundsOptions(
//               padding: EdgeInsets.all(50),
//             ),
//             markers: [
//               currentUserMarker,
//               //IAI Marker
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 80,
//         width: 80,
//         point: LatLng(3.81364,11.55838),
//         builder: (ctx) => Icon(Icons.school)
//       ),

//       //Hospital marker

//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 80,
//         width: 80,
//         point: LatLng(3.86428,11.52779),
//         builder: (ctx) => Icon(Icons.local_hospital,color: Colors.red,),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 80,
//         width: 80,
//         point: LatLng(3.86927,11.51249),
//         builder: (ctx) => Icon(Icons.local_hospital,color: Colors.red,),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 80,
//         width: 80,
//         point: LatLng(3.87358,11.51246),
//         builder: (ctx) => Icon(Icons.local_hospital,color: Colors.red,),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 80,
//         width: 80,
//         point: LatLng(49.8566, 3.3522),
//         builder: (ctx) => Icon(Icons.pin_drop),
//       ),
//               ],
//                   polygonOptions: PolygonOptions(
//                 borderColor: Colors.blueAccent,
//                 color: Colors.black12,
//                 borderStrokeWidth: 3),
//             popupOptions: PopupOptions(
//                 popupSnap: PopupSnap.top,
//                 popupController: _popupController,
//                 popupBuilder: (_, marker) => Container(
//                       width: 200,
//                       height: 100,
//                       color: Colors.white,
//                       child: GestureDetector(
//                         onTap: () => debugPrint("Popup tap!"),
//                         child: Text(
//                           "Container popup for marker at ",
//                         ),
//                       ),
//                     )),
//             builder: (context, markers) {
//               return FloatingActionButton(
//                 child: Text(markers.length.toString()),
//                 onPressed: null,
//               );
//             },
//       ) ,
//       CircleLayerOptions(
//         circles: [
//           new CircleMarker(
//             point: LatLng(userCurrentlat,userCurrentlong),
//             color: Colors.blue.withOpacity(0.2),
//             borderStrokeWidth: 2.0,
//             borderColor: Colors.blue,
//             radius: 50
//           )
//         ]
//       ) 
//     ],
    
//   ),
//         Positioned(
//       bottom: 80.0,
//       right: 15.0,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0)
//         ),
//         child: FloatingActionButton(
//           elevation: 3.0,
//           backgroundColor: Colors.blue,

//           onPressed: (){ //fonction permettant de centrer la map sur la position de l'utilisateur
//             statefulMapController.mapController.move(LatLng(userCurrentlat,userCurrentlong), 11.0);
//             print('map centered to user location');
//           },
//           child: Icon(Icons.filter_center_focus),
//         ),
//       ),
//     ),
//     Positioned(
//       top: 180.0,
//       right: 15.0,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0)
//         ),
//         child: FloatingActionButton(
//           elevation: 3.0,
//           backgroundColor: Colors.blue,

//           onPressed: (){ //affiche la legende de la carte dans un bottom sheet
//             showModalBottomSheet(context: context,
//             isScrollControlled: true,
//              builder: (BuildContext context)
//             {
//               return Container(
//                 height: 185,
//                 child: Center(
//                   child: Column(children: <Widget>[
//                     Text("FG")
//                   ],),
//                 ),
//               );
//             }
//             );
//           },
//           child: Text('L'),
//         ),
//       ),
//     ),
//       ],
//     );
    
    

// }