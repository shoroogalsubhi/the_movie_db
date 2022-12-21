import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';
import '../../controller/movies_controller.dart';
import '../../models/movies_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/title_text_widget.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextWidget(text: "Now Playing"),
        GetBuilder<MoviesController>(builder: (data) {
          return data.isLoadedNowPlaying? SizedBox(
            height: Dimensions.pageViewContainer,
            child: PageView.builder(
                controller: pageController,
                itemCount: data.nowPlayingList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, data.nowPlayingList[position]);
                }),
          ): const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, Result nowPlaying) {

    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currentScale, 1.0)
        ..setTranslationRaw(0, currentTrans, 0);
    }
    else if (index == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currentScale, 1.0)
        ..setTranslationRaw(0, currentTrans, 0);

    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currentScale, 1.0)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: (){
          Get.toNamed(RouteHelper.getMovieDetail(nowPlaying.id!, RouteHelper.moviesHome));
        },
        child: Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.width10,
              vertical: Dimensions.height10
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(AppConstants.image + nowPlaying.backdropPath!),
            ),
          ),
        ),
      ),
    );
  }
}
