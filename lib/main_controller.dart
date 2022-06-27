import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senior_test/main_model.dart';

class MainController {
  final StreamController _streamController = StreamController.broadcast();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;
  late List items;
  List<Movies> movies = [];

  Future<List<Movies>> consultMovie(String name) async {
    final response = await http.get(
      Uri.parse("https://senior2test.herokuapp.com/api/movies?Title=$name"),
    );
    items = json.decode(response.body).cast<Map<String, dynamic>>();
    movies = items.map<Movies>((json) {
      return Movies.fromJson(json);
    }).toList();
    _streamController.sink.add(movies);
    return movies;
  }
}
