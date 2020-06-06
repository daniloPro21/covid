
import 'dart:async';
import 'package:geolocator/geolocator.dart';

double userCurrentlat;
double userCurrentlong;


void getPosition() async {

  Position currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

 userCurrentlat = currentPosition.latitude;
 userCurrentlong = currentPosition.longitude;
  
}



