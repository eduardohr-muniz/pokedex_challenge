part of 'pokemon_entity.dart';

class MovesEntities {
  String name;
  String url;
  String typeName;
  MovesEntities({
    this.name = '',
    this.url = '',
    this.typeName = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'typeName': typeName,
    };
  }

  factory MovesEntities.fromMap(Map<String, dynamic> map) {
    return MovesEntities(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      typeName: map['type']['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovesEntities.fromJson(String source) => MovesEntities.fromMap(json.decode(source));
}
