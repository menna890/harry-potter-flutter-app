import 'package:harry_final/constant/string.dart';
import 'package:dio/dio.dart';

class BookandMovieWebService {
  late Dio dio;
  BookandMovieWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlBooksMo,
      connectTimeout: const Duration(milliseconds: 10 * 1000),
      receiveTimeout: const Duration(milliseconds: 10 * 1000),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  ///
  /// Fetches a list of books from the HP API.
  ///
  /// A GET request is sent to <https://hp-api.onrender.com/api/characters>. The
  /// response is expected to be a JSON array of book objects.
  ///
  /// If the request is successful, the response is logged to the console at the
  /// debug level, and the list of books is returned.
  ///
  /// If the request fails, the error is logged to the console at the error
  /// level, and an empty list is returned.
  ///
  //
  /// @returns A list of book objects, or an empty list if the request fails.
  //
  Future<List<dynamic>> getBooks() async {
    try {
      Response response = await dio.get("books");
      print(response.data.toString());
      return response.data['data'] as List<dynamic>;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getMovies() async {
    try {
      Response response = await dio.get("movies");
      print(response.data.toString());
      return response.data['data'] as List<dynamic>;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
