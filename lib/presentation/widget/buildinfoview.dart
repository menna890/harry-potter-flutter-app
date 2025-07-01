import 'package:flutter/material.dart';
class Buildinfoview extends StatelessWidget {
  final String title;
  final String value;
  const Buildinfoview({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: "${title} : ",
            style: TextStyle(
              fontFamily: 'WitcherKnight',
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
    // return Row(
    //   children: [
    //     Column(
    //       children: [
    //         Text(
    //           "${title} : ",
    //           style: TextStyle(
    //             fontFamily: 'WitcherKnight',
    //             fontSize: 28,
    //             color: Colors.white,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         Divider(color: kSecondaryColor, thickness: 1.5),
    //       ],
    //     ),
    //     // Text(value, style: TextStyle(fontSize: 20, color: Colors.white)),
    //   ],
    // );
  }
}
