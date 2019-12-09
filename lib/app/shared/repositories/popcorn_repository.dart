import 'dart:convert';

import 'package:dio/dio.dart';

import '../interceptors/custom_dio.dart';
import '../models/category_enum.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

export '../models/category_enum.dart';
export '../models/movie_model.dart';

class PopcornRepository {
  var url = "https://tv-v2.api-fetch.website";
  final CustomDio dio;
  Dio get instance => dio.instance;

  PopcornRepository(this.dio);

  Future<List<MovieModel>> getList({
    int page = 1,
    CategoryEnum category = CategoryEnum.movies,
  }) async {
    var response = await instance.get(
      "$url/${categoryEnumValue[category]}/$page",
      queryParameters: {"sort": "rating"},
    );
    var data =
        response.data is String ? jsonDecode(response.data) : response.data;
    return (data as List)
        .map((item) => MovieModel.fromJson(item)..category = category)
        .toList();
  }

  Stream<List<MovieModel>> getList2({
    int page = 1,
    CategoryEnum category = CategoryEnum.movies,
  }) {
    return dio.get(
      "$url/${categoryEnumValue[category]}/$page",
      queryParameters: {"sort": "rating"},
    ).map((response) {
      var data =
          response.data is String ? jsonDecode(response.data) : response.data;
      return (data as List)
          .map((item) => MovieModel.fromJson(item)..category = category)
          .toList();
    });
  }

  Future<MovieDetailsModel> getDetails({
    String id,
    CategoryEnum category,
  }) async {
    var response =
        await instance.get("$url/${categoryEnumDetails[category]}/$id");
    var data =
        response.data is String ? jsonDecode(response.data) : response.data;
    return MovieDetailsModel.fromJson(data);
  }
}
