import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_poll/models/poll.dart';

class Api {
  static Future<Dio> dioAuth() async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: "http://192.168.1.111", responseType: ResponseType.json);
    return Dio(baseOptions);
  }

  static Future<List<Poll>?> getPoll(int id) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/poll");
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data;
        return list.map((e) => Poll.fromMap(e)).toList();
      }
      return null;
    } on DioError catch (err) {
      debugPrint("Get Poll Error $err");
      return null;
    }
  }

  static Future<List<Poll>?> getAllPolls() async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/poll/all");
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data;
        return list.map((e) => Poll.fromMap(e)).toList();
      }
      return null;
    } on DioError catch (err) {
      debugPrint("Get Poll Error $err");
      return null;
    }
  }

  static Future<Poll?> createPoll(Poll poll) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.post("/poll", data: {
        "title": poll.title,
        "description": poll.description,
        "options": poll.options,
      });
      if (response.statusCode == 200) {
        return Poll.fromMap(response.data);
      }
      return null;
    } on DioError catch (err) {
      debugPrint("Create Poll Error $err");
      return null;
    }
  }

  static Future<List<int>?> vote(int id, int index) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.patch("/poll", queryParameters: {
        "id": id,
        "index": index,
      });
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data;
        return list.map((e) => int.parse(e.toString())).toList();
      }
      return null;
    } on DioError catch (err) {
      debugPrint("Votes Error $err");
      return null;
    }
  }
}
