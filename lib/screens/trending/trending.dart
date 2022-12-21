import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/trending_controller.dart';
import '../../models/movies_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    Get.find<TrendingController>().getTrendingList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<TrendingController>(builder: (data) {
        return data.isLoaded? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.trendingList.length,
            itemBuilder: (context, position) {
              return _buildPageItem(position, data.trendingList[position]);
            }): const CircularProgressIndicator(
          color: AppColors.mainColor,
        );
      }),
    );
  }


  Widget _buildPageItem(int index, Result trending) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getMovieDetail(trending.id!, RouteHelper.trending));
      },
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            // width: Dimensions.width40*3,
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width30,
                vertical: Dimensions.height20
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.image + trending.backdropPath!),
              ),
            ),
          ),
          FavoriteWidget(
            movie: trending,
            size: 2,
          ),

        ],
      ),
    );
  }
}
