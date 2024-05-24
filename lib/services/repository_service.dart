import 'package:brainstation/models/post.dart';
import 'package:brainstation/models/repository.dart';
import 'package:brainstation/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RepositoryService {
  DioClient dio = DioClient();
  

  Future<Repository> fetchRepositories(
      {required String query, required int perPage, required int page}) async {
    try {
      Response response =
          await dio.client.get("$query&per_page=$perPage&page=$page");
      return Repository.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Post> fetchPostDetails(int id) async {
    try {
      Response response = await dio.client.get("/posts/$id");
      //List<dynamic> postMaps = response.data;
      return Post.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
