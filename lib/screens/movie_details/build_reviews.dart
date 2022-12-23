import 'package:flutter/material.dart';
import '../../controller/movie_details_controller.dart';
import '../../widgets/movie_details_widgets/reviews_widget.dart';

class BuildReviews extends StatelessWidget {
  final MovieDetailsController data;

  const BuildReviews({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ReviewsWidget(
          icon: Icons.star,
          text: "${data.movieInfo.voteAverage}/10",
        ),
        ReviewsWidget(
          icon: Icons.reviews,
          text: "${data.movieInfo.voteCount} Reviews",
        ),
      ],
    );
  }
}
