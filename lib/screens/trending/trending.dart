import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/trending_controller.dart';
import '../../models/movies_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
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
        // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
      },
      child: Container(
        height: Dimensions.pageViewContainer,
        width: Dimensions.width40*3,
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.width30,
            vertical: Dimensions.height20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: index.isEven ? AppColors.secondColor : AppColors.thirdColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(AppConstants.image + trending.backdrop_path!),
          ),
        ),
      ),
    );
  }
}
