part of 'harry_cubit.dart';

@immutable
sealed class HarryState {}

final class CharactersInitial extends HarryState {}


final class CharbookmovieLoaded extends HarryState {
  final List<HarryCharacters> characters ;
  final List<HarryBook> books ;
  final List<HarryMovies> movies ;

  CharbookmovieLoaded({required this.characters , required this.books, required this.movies});
}

// final class BooksLoaded extends HarryState {
//   final List<HarryBook> books;

//   BooksLoaded({required this.books});
// }

// final class MoviesLoaded extends HarryState {
//   final List<HarryMovies> movies;

//   MoviesLoaded({required this.movies});
// }
