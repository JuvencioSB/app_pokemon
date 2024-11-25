import 'package:floor/floor.dart';

@entity
class Pokemon {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String url;

  Pokemon({required this.id, required this.name, required this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
    };
  }
}
