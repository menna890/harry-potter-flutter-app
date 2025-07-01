import 'package:flutter/material.dart';

class ItemsModel extends StatelessWidget {
  final String? name;
  final String? image;

  const ItemsModel({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      padding: EdgeInsetsDirectional.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 237, 238, 231),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: const Color.fromARGB(137, 164, 162, 162),
          alignment: Alignment.bottomCenter,
          child: Text(
            name!,
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontFamily: "WitcherKnight",
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: Colors.white,
          child:
              image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: "assets/images/loading.gif",
                    image: image!,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/noimage.png",
                        fit: BoxFit.cover,
                      );
                    },
                  )
                  : Image.asset("assets/images/noimage.png"),
          
        ),
      ),
    );
  }
}
