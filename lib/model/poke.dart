class Pokemon {
  final int id;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final List<String> weaknesses;
  bool isFavorited;

  Pokemon({
    required this.id,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.weaknesses,
    this.isFavorited = false,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'] ?? '',
      img: json['img'] ?? '',
      type: (json['type'] as List<dynamic>).map((item) => item as String).toList(),
      height: json['height'] ?? '',
      weight: json['weight'] ?? '',
      weaknesses: (json['weaknesses'] as List<dynamic>).map((item) => item as String).toList(),
    );
  }
}