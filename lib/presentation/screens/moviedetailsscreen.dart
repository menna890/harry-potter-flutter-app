import 'package:flutter/material.dart';
import 'package:harry_final/constant/colors.dart';
import 'package:harry_final/data/model/harrymovies.dart';
import 'package:harry_final/presentation/widget/AppBar/buildsliverappbar.dart';
import 'package:harry_final/presentation/widget/buildinfoview.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Moviedetailsscreen extends StatefulWidget {
  final HarryMovies movieinfo;
  const Moviedetailsscreen({super.key, required this.movieinfo});

  @override
  State<Moviedetailsscreen> createState() => _MoviedetailsscreenState();
}

class _MoviedetailsscreenState extends State<Moviedetailsscreen> {
  // TO control the youtube video functionality
  late YoutubePlayerController _controller;
  // bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(
            name: widget.movieinfo.attributes.title!,
            id: widget.movieinfo.id,
            image: widget.movieinfo.attributes.cover!,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(8, 14, 12, 5),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Buildinfoview(
                      title: "Name",
                      value: widget.movieinfo.attributes.title!,
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: "editors",
                      value: widget.movieinfo.attributes.editors.join(", "),
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: "producers",
                      value: widget.movieinfo.attributes.producers.join(", "),
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: " summary",
                      value: widget.movieinfo.attributes.summary!,
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: "budget",
                      value: widget.movieinfo.attributes.budget!,
                    ),
                    buildDevider(),
                    Buildinfoview(
                      title: "runningTime",
                      value: widget.movieinfo.attributes.runningTime!,
                    ),
                    buildDevider(),
                    Text(
                      "Trailers",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 200, // Fixed height or use aspect ratio
                      child:AspectRatio(
                    aspectRatio: 16 / 9,
                    child: YoutubePlayer(
                      controller: _controller,
                      aspectRatio: 16 / 9,
                    ),
                  )
                    //       !_isPlayerReady
                    //           ? Center(
                    //             child: CircularProgressIndicator(
                    //               color: kSecondaryColor,
                    //             ),
                    //           )
                    //           : YoutubePlayer(
                    //             controller: _controller,
                    //             aspectRatio: 16 / 9,
                    //           ),
                    // ),
                    ),
                    buildDevider(),
                    SizedBox(height: 200),
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

  String _extractVideoId(String url) {
    final regExp = RegExp(
      r'^.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/|shorts\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
      caseSensitive: false,
    );
    final match = regExp.firstMatch(url);
    return match?.group(1) ?? '';
  }

  Future<void> _initPlayer() async {
    final videoId = _extractVideoId(widget.movieinfo.attributes.trailer!);

    if (videoId.isEmpty) {
      debugPrint('Invalid YouTube URL');
      return;
    }
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
        loop: false,
      ),
    );

    try {
      await _controller.loadVideoById(videoId: videoId);
      // setState(() => _isPlayerReady = true);
    } catch (e) {
      debugPrint('Player error: $e');
    }
  }
}
