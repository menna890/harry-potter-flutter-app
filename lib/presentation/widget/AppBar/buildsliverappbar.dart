import 'package:flutter/material.dart';
import 'package:harry_final/constant/colors.dart';

class buildSliverAppbar extends StatelessWidget {
  final String image;
  final String name;
  final String id;
  const buildSliverAppbar({
    super.key,
    required this.image,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      expandedHeight: 700,
      stretch: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          name,
          style: TextStyle(
            fontFamily: 'WitcherKnight',
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        // centerTitle: true,
        titlePadding: const EdgeInsets.all(10),
        background: Hero(
          tag: id,
          child: Image.network(image, fit: BoxFit.cover),
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}
