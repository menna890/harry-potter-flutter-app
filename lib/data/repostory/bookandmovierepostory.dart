import 'package:harry_final/data/model/harrybooks.dart';
import 'package:harry_final/data/model/harrymovies.dart';
import 'package:harry_final/data/web_service/bookandmoviewebservice.dart';

class BookandMovierepostory {
  late BookandMovieWebService bookWebService;

  BookandMovierepostory({required this.bookWebService});

  Future<List<HarryBook>> getBooks() async {
    final books = await bookWebService.getBooks();
    return books.map((book) => HarryBook.fromJson(book)).toList();
  }

  Future<List<HarryMovies>> getMovies() async {
    final movie = await bookWebService.getMovies();
    return movie.map((movie) => HarryMovies.fromJson(movie)).toList();
  }
}
