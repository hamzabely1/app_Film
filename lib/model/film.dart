
//Film: qui contient des données sur une photo

class Film {
  final int id;
  final String titre;
  final String image;
  final String description;
  final String date;
  const Film({
    required this.id,
    required this.titre,
    required this.image,
    required this.description,
    required this.date,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as int,
      titre: json['title'] as String,
      image: json["poster_path"] as String,
      description: json["overview"] as String,
      date: json["release_date"] as String,
    );
  }
}
