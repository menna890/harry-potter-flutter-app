import 'package:flutter/material.dart';
import 'package:harry_final/constant/colors.dart';
import 'package:harry_final/data/model/harrycharacter.dart';
import 'package:harry_final/presentation/widget/AppBar/buildsliverappbar.dart';
import 'package:harry_final/presentation/widget/buildinfoview.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final HarryCharacters characterinfo;
  const CharacterDetailsScreen({super.key, required this.characterinfo});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(
            name:characterinfo.name!,
            id:characterinfo.id!,
            image: characterinfo.image!,
          ), // explain the ! && ? in the values
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(8, 14, 12, 5),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Buildinfoview(title: "Name",value:  characterinfo.name!),
                    buildDevider(),
                    Buildinfoview(title: "Actor",value:  characterinfo.actor!),
                    buildDevider(),
                    Buildinfoview(title: 
                      "AlternateNames",value: 
                      characterinfo.alternateNames.join(", ") ,
                    ),
                    buildDevider(),
                    Buildinfoview(title: 
                      "yearOfBirth",value: 
                      characterinfo.yearOfBirth.toString() ,
                    ),
                    buildDevider(),
                    Buildinfoview(title: "House",value:  characterinfo.house ?? "Unknown"),
                    buildDevider(),
                    Buildinfoview(title:"dateOfBirth",value:  characterinfo.dateOfBirth ?? "Unknown"),
                    buildDevider(),
                    SizedBox(height: 600),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
  Widget buildDevider() {
    return Divider(
      color: kSecondaryColor,
      thickness: 1.5,
      indent: 2,
      endIndent: 50,
    );
  }
}
