import 'dart:convert';
import 'package:http/http.dart' as http;

Future<JsonModel> getDataFromApi() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    return modelFromJson(response.body);
}

JsonModel modelFromJson(String str) => JsonModel.fromJson(json.decode(str));

String modelToJson(JsonModel data) => json.encode(data.toJson());

class JsonModel {
    JsonModel({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    int? userId;
    int? id;
    String? title;
    bool? completed;

    factory JsonModel.fromJson(Map<String, dynamic> json) => JsonModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}