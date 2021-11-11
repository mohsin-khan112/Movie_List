import 'package:dignizant_demo/Model/Movie.dart';

class MoviesData {
  List<Movie>? movies;

  MoviesData.fromJson(Map<String, dynamic> json)
      : movies = Movie.fromJsonArray(json['movies']);
}
