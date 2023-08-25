import 'dart:convert';

import 'package:hive/hive.dart';
part 'moves_model.g.dart';

@HiveType(typeId: 3)
class MovesModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  @HiveField(2)
  String typeName;
  MovesModel({
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

  factory MovesModel.fromMap(Map<String, dynamic> map) {
    return MovesModel(
      name: map['move'] != null ? map['move']['name'] : "",
      url: map['move'] != null ? map['move']['url'] : "",
      typeName: map['type'] != null ? map['type']['name'] : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory MovesModel.fromJson(String source) => MovesModel.fromMap(json.decode(source));
}
