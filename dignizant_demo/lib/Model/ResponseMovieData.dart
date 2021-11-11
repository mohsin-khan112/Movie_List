import 'package:dignizant_demo/Model/MoviesData.dart';

class ResponseMovieData {
  MoviesData? moviesData;

  ResponseMovieData.fromJson(Map<String, dynamic> json)
      : moviesData = MoviesData.fromJson(json['data']);
}
