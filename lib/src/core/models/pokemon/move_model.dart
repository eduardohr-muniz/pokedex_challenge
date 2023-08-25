import 'dart:convert';

import 'package:hive/hive.dart';
part 'move_model.g.dart';

@HiveType(typeId: 3)
class MoveModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  @HiveField(2)
  String typeName;
  MoveModel({
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

  factory MoveModel.fromMap(Map<String, dynamic> map) {
    return MoveModel(
      name: map['move'] != null ? map['move']['name'] : "",
      url: map['move'] != null ? map['move']['url'] : "",
      typeName: map['type'] != null ? map['type']['name'] : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveModel.fromJson(String source) => MoveModel.fromMap(json.decode(source));
}
