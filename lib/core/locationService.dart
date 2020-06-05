
import 'dart:async';
import 'package:geolocator/geolocator.dart';

double lat;
double long;


void getPosition() async {

  Position dPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

 lat = dPosition.latitude;
 long = dPosition.longitude;

 
  
}



