import 'dart:convert';

import 'package:hive/hive.dart';

part 'stat_model.g.dart';

@HiveType(typeId: 1)
class StatModel {
  @HiveField(0)
  double baseStat;
  @HiveField(1)
  String name;
  StatModel({
    this.baseStat = 0.0,
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'name': name,
    };
  }

  factory StatModel.fromMap(Map<String, dynamic> map) {
    return StatModel(
      baseStat: map['base_stat']?.toDouble() ?? 0.0,
      name: map['stat']['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StatModel.fromJson(String source) => StatModel.fromMap(json.decode(source));
}
