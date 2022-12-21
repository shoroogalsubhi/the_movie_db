import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/favorites_controller.dart';
import '../models/movies_model.dart';
import '../utils/dimensions.dart';

class FavoriteWidget extends StatefulWidget {
  final Result movie;
  final int size;

  const FavoriteWidget({Key? key,
    required this.movie,
    this.size = 1,
  }) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  final favoritesController = Get.find<FavoritesController>();
  bool isFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = favoritesController.isInFavoriteList(widget.movie.id!);
  }

  @override
  Widget build(BuildContext context) {
    // I used InkWell instead of the IconButton to center
    // the ❤ in the Container
    return Positioned(
      right: Dimensions.width20 * widget.size,
      top: Dimensions.height15 * widget.size,
      child: GetBuilder<FavoritesController>(builder: (data) {
          return InkWell(
            onTap: (){
              setState(() {
                isFavorite = !isFavorite;
                favoritesController.toggle(widget.movie.id!,isFavorite);
              });
            },
            child: Container(
              height: Dimensions.width30,
              width: Dimensions.width30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white60,
              ),
              child: Icon(
                isFavorite?Icons.favorite:Icons.favorite_border_rounded,
                color: isFavorite?Colors.red:Colors.black87,
                size: Dimensions.width20,
              ),
            ),
          );
        }
      ),
    );
  }
}
