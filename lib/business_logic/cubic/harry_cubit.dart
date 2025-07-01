import 'package:bloc/bloc.dart';
import 'package:harry_final/data/model/harrybooks.dart';
import 'package:harry_final/data/model/harrycharacter.dart';
import 'package:harry_final/data/model/harrymovies.dart';
import 'package:harry_final/data/repostory/bookandmovierepostory.dart';
import 'package:harry_final/data/repostory/charaterrepostory.dart';
import 'package:meta/meta.dart';

part 'harry_state.dart';

class CharactersCubit extends Cubit<HarryState> {
  final Charaterrepostory characterrepostory;
  List<HarryCharacters> characters = [];
  // final Movierepostory movieRepository;
  List<HarryMovies> movies = [];
  final BookandMovierepostory bookrepostory;
  List<HarryBook> books = [];

  CharactersCubit({
    required this.bookrepostory,
    required this.characterrepostory,
  }) : super(CharactersInitial());

  void getAllitems() async {
    characters = await characterrepostory.getCharacter();

    movies = await bookrepostory.getMovies();
    books = await bookrepostory.getBooks();
    emit(
      CharbookmovieLoaded(characters: characters, books: books, movies: movies),
    );
  }

}
