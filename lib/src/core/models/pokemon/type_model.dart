import 'dart:convert';

import 'package:hive/hive.dart';

part 'type_model.g.dart';

@HiveType(typeId: 2)
class TypeModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  TypeModel({
    this.name = '',
    this.url = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      name: map['type']['name'] ?? '',
      url: map['type']['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) => TypeModel.fromMap(json.decode(source));
}
