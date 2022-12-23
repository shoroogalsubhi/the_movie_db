import 'package:flutter/material.dart';
import 'package:the_movie_db/screens/movies_home/now_playing.dart';
import 'package:the_movie_db/screens/movies_home/upcoming.dart';
import 'package:the_movie_db/utils/colors.dart';
import '../../utils/dimensions.dart';
import 'movies.dart';

class MoviesHome extends StatelessWidget {
  const MoviesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
            "assets/images/blue_short.png",
            width: Dimensions.homeLogo
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        automaticallyImplyLeading: false,
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
