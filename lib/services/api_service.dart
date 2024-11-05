import 'dart:convert';
import 'package:api_project/models/FilmModel.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String baseUrl = 'https://swapi.dev/api/films/';

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List films = data['results'];
      return films.map((film) => Film.fromJson(film)).toList();
    } else {
      throw Exception('Failed to load films');
    }
  }
}
