import 'package:flutter/material.dart';

import 'package:harry_final/data/model/harrycharacter.dart';
import 'package:harry_final/presentation/widget/item_model.dart';
class CharactersGrid extends StatelessWidget {
  final  List<HarryCharacters> allcharacters;
  const CharactersGrid({super.key, required this.allcharacters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: allcharacters.length,
      itemBuilder: (context, index) {
        print(
          "the character is +++++++++++++++++\n ${allcharacters[index].name}",
        );
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/characterdetailsscreen',arguments: allcharacters[index]),
          child: Hero(
            tag: allcharacters[index].id!, //the important of tag 
            child: ItemsModel(
              name:allcharacters[index].name,
              image: allcharacters[index].image
            ),
          ),
        );
      },
    );
  }
}