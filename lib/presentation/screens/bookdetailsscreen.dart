import 'package:flutter/material.dart';
import 'package:harry_final/constant/colors.dart';
import 'package:harry_final/data/model/harrybooks.dart';
import 'package:harry_final/presentation/widget/AppBar/buildsliverappbar.dart';
import 'package:harry_final/presentation/widget/buildinfoview.dart';

class Bookdetailsscreen extends StatelessWidget {
  final HarryBook bookinfo;
  const Bookdetailsscreen({super.key, required this.bookinfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(
            name: bookinfo.attributes!.title!,
            id: bookinfo.id!,
            image: bookinfo.attributes!.cover!,
          ), 
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(8, 14, 12, 5),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Buildinfoview(
                      title: "Name",
                      value: bookinfo.attributes!.title!,
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: "author",
                      value: bookinfo.attributes!.author!,
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: "pages",
                      value: bookinfo.attributes!.pages!.toString(),
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: " summary",
                      value: bookinfo.attributes!.summary!,
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: "releaseDate",
                      value: bookinfo.attributes!.releaseDate!,
                    ),
                    buildDevider(),
                    SizedBox(height: 400),
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
