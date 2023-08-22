part of 'pokemon_entity.dart';

class TypeEntity {
  String name;
  String url;
  TypeEntity({
    this.name = '',
    this.url = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory TypeEntity.fromMap(Map<String, dynamic> map) {
    return TypeEntity(
      name: map['type']['name'] ?? '',
      url: map['type']['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeEntity.fromJson(String source) => TypeEntity.fromMap(json.decode(source));
}
