import 'package:flutter/material.dart';
import 'package:harry_final/data/model/harrybooks.dart';
import 'package:harry_final/data/model/harrymovies.dart';
import 'package:harry_final/presentation/widget/item_model.dart';

class ElementCarousel extends StatelessWidget {
  final List<dynamic> allitems;

  const ElementCarousel({super.key, required this.allitems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allitems.length,
          itemBuilder: (context, index) {
            final item = allitems[index];
            // debugPrint('Building item $index: ${item?.runtimeType}');

            // Null check
            if (item == null || item.attributes == null) {
              return const SizedBox(width: 150);
            }

            final attributes = item.attributes!;
            final width =
                MediaQuery.of(context).size.width * 0.8; // 60% of screen width

            return Container(
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    // print('Tapped item: ${item.id}');
                    if (item is HarryBook) {
                      Navigator.pushNamed(
                        context,
                        '/bookdetailsscreen',
                        arguments: item,
                      );
                    } else if (item is HarryMovies) {
                      Navigator.pushNamed(context, "/moviedetailsscreen",arguments: item);
                    }
                  },
                  child:
                      item is HarryBook
                          ? Hero(
                            tag: 'book_${item.id}',
                            child: ItemsModel(
                              name: attributes.title ?? 'No Title',
                              image: attributes.cover,
                            ),
                          )
                          : Hero(
                            tag: 'movie_${item.id}',
                            child: ItemsModel(
                              name: attributes.title ?? 'No Title',
                              image: attributes.cover,
                            ),
                          ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
