// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';

// Define the function to reverse geocode a location
Future<String> reverseGeocode(LatLng location) async {
  // Call the geocoding API to get the address of the location
  List<Placemark> placemarks =
      await placemarkFromCoordinates(location.latitude, location.longitude);

  // Extract the address from the placemark
  Placemark placemark = placemarks[0];
  String address =
      '${placemark.locality}, ${placemark.administrativeArea} , ${placemark.country}';

  // Return the address
  return address;
}
