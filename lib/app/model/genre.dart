class Genre {
  Genre({
    required this.id,
    this.name,
  });

  late final int id;
  late final String? name;

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}