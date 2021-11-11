class Movie {
  int? id;
  String? name;
  String? year;
  String? thumbnail;

  Movie(this.id, this.name, this.year, this.thumbnail);

  static List<Movie>? fromJsonArray(List<dynamic>? movieJsonList) {
    List<Movie>? moviesList =
        movieJsonList?.map((e) => Movie.fromJson(e)).toList();
    return moviesList;
  }

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        year = json['year'],
        thumbnail = (json['thumbnail'] as String).replaceFirst(RegExp("/thumb/"), "/medium/", );
}
