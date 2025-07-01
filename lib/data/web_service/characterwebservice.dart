// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:harry_final/constant/string.dart';
import 'package:dio/dio.dart';

class CharacterWebService {
  late Dio dio;
  CharacterWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlcharacter,
      connectTimeout: const Duration(milliseconds: 10 * 1000),
      receiveTimeout: const Duration(milliseconds: 10 * 1000),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }
  Future<List<dynamic>> getCharacter() async {
    try {
      Response response = await dio.get("characters");
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}