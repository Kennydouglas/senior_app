import 'package:flutter_test/flutter_test.dart';
import 'package:senior_test/main_controller.dart';
import 'package:senior_test/main_model.dart';

void main() {
  test('quant. of years', () async {
    String movie1 = 'waterworld';
    String movie2 = 'Amazing Spiderman Syndrome';
    MainController mainController = MainController();
    List movies = [];
    movies = (await mainController.consultMovie(movie1));
    expect(movies.length, equals(5));
    movies = (await mainController.consultMovie(movie2));
    expect(movies.length, equals(1));
  });
  test('quant. of movies', () async {
    String movie1 = 'waterworld';
    String movie2 = 'Amazing Spiderman Syndrome';
    MainController mainController = MainController();
    List<Movies> movies = [];
    List<int> listMovies = [];
    movies = (await mainController.consultMovie(movie1));
    for (var element in movies) {
      listMovies.add(element.movies);
    }
    expect(listMovies, equals([10, 27, 45, 70, 177]));
    listMovies.clear();
    movies = (await mainController.consultMovie(movie2));
    for (var element in movies) {
      listMovies.add(element.movies);
    }
    expect(listMovies, equals([150]));
  });
}
