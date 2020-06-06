
import 'dart:async';
import 'package:geolocator/geolocator.dart';

double userCurrentlat;
double userCurentlong;


void getPosition() async {

  Position currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

 userCurrentlat = currentPosition.latitude;
 userCurentlong = currentPosition.longitude;

 
  
}



