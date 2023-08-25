import 'dart:convert';

import 'package:hive/hive.dart';

part 'stats_model.g.dart';

@HiveType(typeId: 1)
class StatsModel {
  @HiveField(0)
  double baseStat;
  @HiveField(1)
  String name;
  StatsModel({
    this.baseStat = 0.0,
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'name': name,
    };
  }

  factory StatsModel.fromMap(Map<String, dynamic> map) {
    return StatsModel(
      baseStat: map['base_stat']?.toDouble() ?? 0.0,
      name: map['stat']['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StatsModel.fromJson(String source) => StatsModel.fromMap(json.decode(source));
}
