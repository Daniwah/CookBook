import 'dart:convert';

ModelDetailMasakan modelDetailMasakanFromJson(Map<String, dynamic> str) => ModelDetailMasakan.fromJson((str));

String modelDetailMasakanToJson(ModelDetailMasakan data) => json.encode(data.toJson());

class ModelDetailMasakan {
    String method;
    bool status;
    Results results;

    ModelDetailMasakan({
        required this.method,
        required this.status,
        required this.results,
    });

    factory ModelDetailMasakan.fromJson(Map<String, dynamic> json) => ModelDetailMasakan(
        method: json["method"],
        status: json["status"],
        results: Results.fromJson(json["results"]),
    );

    Map<String, dynamic> toJson() => {
        "method": method,
        "status": status,
        "results": results.toJson(),
    };
}

class Results {
    String title;
    String description;
    String image;
    String times;
    String difficulty;
    List<NeedItem> needItem;
    List<String> ingredient;
    List<String> step;

    Results({
        required this.title,
        required this.description,
        required this.image,
        required this.times,
        required this.difficulty,
        required this.needItem,
        required this.ingredient,
        required this.step,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        title: json["title"],
        description: json["description"],
        image: json["image"],
        times: json["times"],
        difficulty: json["difficulty"],
        needItem: List<NeedItem>.from(json["needItem"].map((x) => NeedItem.fromJson(x))),
        ingredient: List<String>.from(json["ingredient"].map((x) => x)),
        step: List<String>.from(json["step"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": image,
        "times": times,
        "difficulty": difficulty,
        "needItem": List<dynamic>.from(needItem.map((x) => x.toJson())),
        "ingredient": List<dynamic>.from(ingredient.map((x) => x)),
        "step": List<dynamic>.from(step.map((x) => x)),
    };
}

class NeedItem {
    String itemName;
    String img;

    NeedItem({
        required this.itemName,
        required this.img,
    });

    factory NeedItem.fromJson(Map<String, dynamic> json) => NeedItem(
        itemName: json["item_name"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "img": img,
    };
}
