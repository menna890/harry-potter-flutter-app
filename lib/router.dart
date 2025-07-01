import 'package:harry_final/data/model/harrybooks.dart';
import 'package:harry_final/data/model/harrycharacter.dart';
import 'package:harry_final/data/model/harrymovies.dart';
import 'package:harry_final/data/repostory/bookandmovierepostory.dart';
// import 'package:harry_final/data/repostory/movierepostory.dart';
import 'package:harry_final/data/web_service/bookandmoviewebservice.dart';
// import 'package:harry_final/data/web_service/moviewebservice.dart';
import 'package:flutter/material.dart';

import 'package:harry_final/business_logic/cubic/harry_cubit.dart';
import 'package:harry_final/data/repostory/charaterrepostory.dart';
import 'package:harry_final/data/web_service/characterwebservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_final/presentation/screens/bookdetailsscreen.dart';
import 'package:harry_final/presentation/screens/characterdetailsscreen.dart';
import 'package:harry_final/presentation/screens/moviedetailsscreen.dart';
import 'presentation/screens/mainscreen.dart';

class AppRouter {
  late Charaterrepostory charaterrepostory;
  late BookandMovierepostory bookrepostory;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charaterrepostory = Charaterrepostory(
      characterWebService: CharacterWebService(),
    );
    bookrepostory = BookandMovierepostory(
      bookWebService: BookandMovieWebService(),
    );
    charactersCubit = CharactersCubit(
      bookrepostory: bookrepostory,
      characterrepostory: charaterrepostory,
    );
  }
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (BuildContext context) => charactersCubit,
                child: CharacterScreen(),
              ),
        );
      case "/characterdetailsscreen":
        final characterinfo = settings.arguments as HarryCharacters;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(characterinfo: characterinfo),
        );
      case "/bookdetailsscreen":
        final bookinfo = settings.arguments as HarryBook?; // Make nullable
        if (bookinfo == null) {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  appBar: AppBar(title: const Text('Error')),
                  body: const Center(child: Text('Book information not found')),
                ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => Bookdetailsscreen(bookinfo: bookinfo),
        );
      case "/moviedetailsscreen":
        final movieinfo = settings.arguments as HarryMovies;
        return MaterialPageRoute(
          builder: (_) => Moviedetailsscreen(movieinfo: movieinfo),
        );
      default:
        return null;
    }
  }
}
