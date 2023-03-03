

import 'dart:convert';

import 'package:module_notification/models/twit_from_api_model.dart';

ApiResponseModel apiResponseModelFromJson(String str) => ApiResponseModel.fromJson(json.decode(str));
String apiResponseModelToJson(ApiResponseModel data) => json.encode(data.toJson());

class ApiResponseModel {
    ApiResponseModel({
        required this.code,
        required this.title,
        required this.message,
        required this.data,
    });

    String code;
    String title;
    String message;
    List<Twit>? data;

    factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
        code: json["code"],
        title: json["title"],
        message: json["message"],
        data: json["data"]!=null? List<Twit>.from(json["data"].map((x) => Twit.fromJson(x))) : json["data"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "message": message,
        "data": data!=null? List<dynamic>.from(data!.map((x) => x.toJson())) : data,
    };
}




