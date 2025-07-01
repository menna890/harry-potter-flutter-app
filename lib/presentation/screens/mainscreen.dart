
import 'package:harry_final/business_logic/cubic/harry_cubit.dart';

import 'package:harry_final/data/model/harrybooks.dart';
import 'package:harry_final/data/model/harrycharacter.dart';
import 'package:harry_final/data/model/harrymovies.dart';
import 'package:harry_final/presentation/widget/element_carousel.dart';
import 'package:harry_final/presentation/widget/characters_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_final/presentation/widget/loading_indicator.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<HarryCharacters> allcharacters;
  late List<HarryBook> allbooks;
  late List<HarryMovies> allmovies;
  bool isSearching = false;
  bool isBook = false;
  TextEditingController searchController = TextEditingController();
  late List<HarryCharacters> searchedlist;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllitems();
    
  }

  Widget buildAppBar() {
    return Text(
      "Harry Potter",
      style: TextStyle(fontSize: 30, fontFamily: 'WitcherKnight'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: isSearching ? buildSearching() : buildAppBar(),
        actions: buildAppBarActions(),
      ),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: buildBlocwidget(),
      
    );
  }

  Widget buildBlocwidget() {
    return BlocBuilder<CharactersCubit, HarryState>(
      builder: (context, state) {
        if (state is CharbookmovieLoaded) {
          allcharacters =
              state.characters.where((character) {
                return character.image != null &&
                    character.image!.isNotEmpty &&
                    character.image!.toLowerCase() != 'null';
              }).toList();
          allbooks = state.books;
          allmovies = state.movies;
          return buildlistLoaded();
        } else {
          return loadingIndicator();
        }
      },
    );
  }

  Widget buildlistLoaded() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 17, 17, 17),
          child: Column(
            children:
                searchController.text.isEmpty
                    ? [
                      currentview(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 14.0,
                              bottom: 10,
                            ),
                            child: Text(
                              "The Main Characters",
                              style: TextStyle(
                                fontFamily: 'WitcherKnight',
                                fontSize: 25,
                                color: const Color.fromARGB(255, 233, 184, 48),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CharactersGrid(allcharacters: allcharacters),
                    ]
                    : [
                      CharactersGrid(
                        allcharacters:
                            searchController.text.isEmpty
                                ? allcharacters
                                : searchedlist,
                      ),
                    ],
          ),
        ),
      ),
    );
  }

  Widget buildSearching() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "find a character",
        hintStyle: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontFamily: "WitcherKnight",
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.black, fontSize: 24),
      cursorColor: Colors.black,
      onChanged: (searchedelement) {
        addSearchedForItemsToSearchedList(searchedelement);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedelement) {
    searchedlist =
        allcharacters
            .where(
              (item) => item.name!.toLowerCase().startsWith(searchedelement),
            )
            .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              searchController.clear();
            });
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: Colors.black),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearching,
          icon: Icon(Icons.search, color: Colors.black),
          style: ButtonStyle(
            iconSize: MaterialStateProperty.all(30),
            backgroundColor: MaterialStateProperty.all(Colors.yellow[800]),
          ),
        ),
      ];
    }
  }

  void startSearching() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    setState(() {
      searchController.clear();
      isSearching = false;
    });
  }

  Widget currentview() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [Tab(text: "Books"), Tab(text: "Movies")],
            indicatorColor: Colors.yellow[800],
            labelColor: Colors.yellow[800],
            unselectedLabelColor: Colors.grey[500],
            labelStyle: TextStyle(
              fontSize: 25,
              fontFamily: 'WitcherKnight',
              fontWeight: FontWeight.bold,
            ),
            indicatorSize: TabBarIndicatorSize.label,
          ),
          SizedBox(
            height: 200, // Fixed height for the content area
            child: TabBarView(
              children: [
                ElementCarousel(allitems: allbooks), // Books content
                ElementCarousel(allitems: allmovies), // Movies content
              ],
            ),
          ),
        ],
      ),
    );
  }

}
