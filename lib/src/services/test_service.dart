import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'package:http_app/src/models/heroe_model.dart';

class TestService {
  final String _baseUrl = 'https://www.hectoralvarez.dev/icc727/';

  Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': 'mi\$up34Token',
  };

  Future<List<HeroeModel>> getHeroes() async {
    final response =
        await http.get(this._baseUrl + 'heroes.json', headers: this._headers);
    if (response.statusCode == 200) {
      Map heroesData = jsonDecode(response.body);
      List<dynamic> heroes = heroesData["heroes"];
      return heroes.map((json) => HeroeModel.fromJson(json)).toList();
    } else {
      throw Exception("Algo anda mal, ${response.statusCode}");
    }
  }
}
