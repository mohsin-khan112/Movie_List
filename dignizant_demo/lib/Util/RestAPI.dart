import 'package:dignizant_demo/Model/Movie.dart';
import 'package:dignizant_demo/Model/MovieDetail.dart';
import 'package:dignizant_demo/Model/ResponseMovieData.dart';
import 'package:dignizant_demo/Model/ResponseMovieDetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestAPI {
  static Future<List<Movie>?> getMovies() async {
    var url = Uri.parse("http://165.22.75.82/v1/movies");
    var response = await http.get(url);
    print('Response Code: ${response.statusCode}.');

    if (response.statusCode == 200) {
      print('Response String: ${response.body}.');

      final allMoviesData =
          ResponseMovieData.fromJson(jsonDecode(response.body));
      return allMoviesData.moviesData!.movies;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }

  static Future<MovieDetails?> getMovieDetails(int? id) async {
    var url = Uri.parse("http://165.22.75.82/v1/movies/${id}");
    var response = await http.get(url);
    print('Response Code: ${response.statusCode}.');

    if (response.statusCode == 200) {
      print('Response String: ${response.body}.');

      final responseMovieDetails =
          ResponseMovieDetails.fromJson(jsonDecode(response.body));
      return responseMovieDetails.movieDetailsData!.movieDetails;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}
