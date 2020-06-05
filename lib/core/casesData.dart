
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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

