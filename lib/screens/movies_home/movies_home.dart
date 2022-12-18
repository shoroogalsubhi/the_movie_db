import 'package:flutter/material.dart';
import 'package:the_movie_db/screens/movies_home/now_playing.dart';
import 'package:the_movie_db/screens/movies_home/upcoming.dart';
import 'package:the_movie_db/utils/colors.dart';

import 'movies.dart';

class MoviesHome extends StatelessWidget {
  const MoviesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies Home"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            NowPlaying(),
            Upcoming(),
            Movies(),
          ],
        ),
      ),
    );
  }
}
