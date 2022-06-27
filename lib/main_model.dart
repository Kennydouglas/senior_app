class Movies {
  late int year;
  late int movies;

  Movies({required this.year, required this.movies});

  Movies.fromJson(Map<String, dynamic> json) {
    year = json['Year:'];
    movies = json['Movies:'];
  }
}
