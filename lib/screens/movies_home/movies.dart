import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/controller/movies_controller.dart';
import '../../models/movies_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';
import '../../widgets/title_text_widget.dart';
import 'build_page_item.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height100*3.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextWidget(text: "Movies"),
          // list of categories
          GetBuilder<MoviesController>(builder: (data) {
            return data.isLoadedCategory? SizedBox(
              height: Dimensions.height30*2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.categoryNamesList.length,
                  itemBuilder: (context, position) {
                    return _buildCategoriesName(position, data);
                  }
              ),
            ): const Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
          }),
          // list of movies based on category/categories
          GetBuilder<MoviesController>(builder: (data) {
            return data.isLoadedCategory? SizedBox(
              height: Dimensions.pageViewContainer,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.categoryMoviesList.length,
                  itemBuilder: (context, position) {
                    return BuildPageItem(index:position, movie: data.categoryMoviesList[position]);
                  }
              ),
            ): const CircularProgressIndicator(
              color: AppColors.whiteColor,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCategoriesName(int index, MoviesController data) {
    var category = data.categoryNamesList[index].name!;
    bool selected = Get.find<MoviesController>().isSelected(data.categoryNamesList[index].id!);
    return Container(
      margin: EdgeInsets.all(Dimensions.width10),
      decoration: BoxDecoration(
          color: selected? AppColors.mainColor2: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20)
      ),
      child: TextButton(
        child: Text(
          category,
          style: TextStyle(
              color: selected? AppColors.whiteColor: AppColors.mainColor,
              fontSize: Dimensions.font16
          ),
        ),
        onPressed: (){
          Get.find<MoviesController>().setSelectedCategory(data.categoryNamesList[index].id!);
        },
      ),
    );

  }


}
