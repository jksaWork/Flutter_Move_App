class Genre {
  late int id;
  late String name;
  late int moviesCount;

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    moviesCount = json['movies_count'] ?? 0;
  }
}

class GenreResponse {
  List<Genre> genres = [];
  GenreResponse.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((genre) => genres.add(Genre.fromJson(genre)));
  }
}
