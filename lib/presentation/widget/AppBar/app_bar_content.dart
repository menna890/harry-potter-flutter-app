// lib/presentation/widgets/app_bar_content.dart
import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  final bool isSearching;
  final TextEditingController searchController;
  final VoidCallback onSearchPressed;
  final VoidCallback onClearPressed; // For the 'X' icon in AppBar actions

  const AppBarContent({
    super.key,
    required this.isSearching,
    required this.searchController,
    required this.onSearchPressed,
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow[800],
      title: isSearching ? _buildSearchingTextField() : _buildAppBarTitle(),
      actions: _buildAppBarActions(),
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      "Harry Potter",
      style: TextStyle(fontSize: 30, fontFamily: 'WitcherKnight'),
    );
  }

  Widget _buildSearchingTextField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "Searching .......",
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: "WitcherKnight",
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      // onChanged is typically handled by the controller's listener in the parent
    );
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: onClearPressed, // Use the provided callback
          icon: Icon(Icons.clear, color: Colors.black),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: onSearchPressed, // Use the provided callback
          icon: Icon(Icons.search, color: Colors.black),
          style: ButtonStyle(
            iconSize: MaterialStateProperty.all(30),
            backgroundColor: MaterialStateProperty.all(Colors.yellow[800]),
          ),
        ),
      ];
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Required for PreferredSizeWidget
}