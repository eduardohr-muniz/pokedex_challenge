import 'dart:convert';

import 'package:hive/hive.dart';

part 'ability_model.g.dart';

@HiveType(typeId: 4)
class AbilityModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;
  AbilityModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory AbilityModel.fromMap(Map<String, dynamic> map) {
    return AbilityModel(
      name: map['ability']['name'] ?? '',
      url: map['ability']['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AbilityModel.fromJson(String source) => AbilityModel.fromMap(json.decode(source));
}
