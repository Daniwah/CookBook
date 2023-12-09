// ignore_for_file: constant_identifier_names

import 'dart:convert';

ModelSearchMasakan modelSearchMasakanFromJson(Map<String, dynamic> str) =>
    ModelSearchMasakan.fromJson((str));

String modelSearchMasakanToJson(ModelSearchMasakan data) =>
    json.encode(data.toJson());

class ModelSearchMasakan {
  String method;
  bool status;
  List<Result> results;

  ModelSearchMasakan({
    required this.method,
    required this.status,
    required this.results,
  });

  factory ModelSearchMasakan.fromJson(Map<String, dynamic> json) =>
      ModelSearchMasakan(
        method: json["method"],
        status: json["status"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "status": status,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String key;
  String title;
  String times;
  Difficulty difficulty;
  String img;

  Result({
    required this.key,
    required this.title,
    required this.times,
    required this.difficulty,
    required this.img,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        key: json["key"],
        title: json["title"],
        times: json["times"],
        difficulty:
            difficultyValues.map[json["difficulty"]] ?? Difficulty.MUDAH,
        //   difficulty: difficultyValues.map[json["difficulty"]]!,
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "times": times,
        "difficulty": difficultyValues.reverse[difficulty],
        "img": img,
      };
}

enum Difficulty { MUDAH, SEDANG }

final difficultyValues =
    EnumValues({"Mudah": Difficulty.MUDAH, "Sedang": Difficulty.SEDANG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
