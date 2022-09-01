class Film {
  final int id;
  final String name;
  final String logoPath;
  final String originCountry;

  const Film({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.originCountry,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as int,
      name: json['name'] as String,
      logoPath: json['logoPath'] as String,
      originCountry: json['originCountry'] as String,
    );
  }
}
