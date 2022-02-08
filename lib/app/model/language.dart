
class Language {
  Language({
    required this.englishName,
    required this.name,
  });

  late final String englishName;
  late final String name;

  Language.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    name = json['name'];
  }

}