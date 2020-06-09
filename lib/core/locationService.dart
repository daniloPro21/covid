

import 'package:geolocator/geolocator.dart';

double userCurrentlat;
double userCurrentlong;


Future<String> getPosition() async {

  Position currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

 userCurrentlat = currentPosition.latitude;
 userCurrentlong = currentPosition.longitude;

 if(userCurrentlat != null && userCurrentlong != null)
 {
   print("Location data loaded");
 }
 else
 {
   throw Exception("Nous ne parvenons pas a acceder a votre position ");
 }

 
 return "success";
  
}








// FlutterMap(
//       mapController: mapController,
//       options:new MapOptions(
//         rotation: 1.0,
//         zoom: 10.0,
//         interactive: true,
//         plugins: [
//           PopupMarkerPlugin()],
//           onTap:  (_) => _popupController.hidePopup(),
//       ),
//     layers: [
//           TileLayerOptions(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerClusterLayerOptions(
//             maxClusterRadius: 120,
//             size: Size(40, 40),
//             anchor: AnchorPos.align(AnchorAlign.center),
//             fitBoundsOptions: FitBoundsOptions(
//               padding: EdgeInsets.all(50),
//             ),
//             markers: [
//               currentUserMarker
//             ],
//             polygonOptions: PolygonOptions(
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
//                           "Container popup for marker at ${marker.point}",
//                         ),
//                       ),
//                     )),
//             builder: (context, markers) {
//               return FloatingActionButton(
//                 child: Text(markers.length.toString()),
//                 onPressed: null,
//               );
//             },
//           ),
//           CircleLayerOptions(
//         circles: [
//           new CircleMarker(
//             point: LatLng(userCurrentlat,userCurrentlong),
//             color: Colors.blue.withOpacity(0.2),
//             borderStrokeWidth: 2.0,
//             borderColor: Colors.blue,
//             radius: 30
//           )
//         ]
//       )
//         ],
//     ),