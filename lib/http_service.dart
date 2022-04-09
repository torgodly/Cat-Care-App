import 'CatBreed_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String postUrl =
      "https://api.thecatapi.com/v1/breeds?limit=10&page=0?api_key=8a7e2013-f3df-4ecd-9854-35e4c86c3a8b";

  Future<List<CatBreed>> getCatBreeds() async {
    var res = await http.get(Uri.parse(postUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = json.decode(res.body);
      List<CatBreed> catBreeds =
          body.map((dynamic item) => CatBreed.fromJson(item)).toList();
      return catBreeds;
    } else {
      throw "Failed to load";
    }
  }
}
