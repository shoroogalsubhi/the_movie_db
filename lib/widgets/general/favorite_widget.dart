import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/favorites_controller.dart';
import '../../models/movies_model.dart';
import '../../utils/dimensions.dart';
import 'app_icon.dart';

class FavoriteWidget extends StatefulWidget {
  final Result movie;

  const FavoriteWidget({Key? key,
    required this.movie,
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
    if(widget.movie.id != null){
      isFavorite = favoritesController.isInFavoriteList(widget.movie.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(builder: (data) {
      return AppIcon(
        icon: isFavorite?Icons.favorite:Icons.favorite_border_rounded,
        color: isFavorite?Colors.red:Colors.black87,
        onTap: (){
          setState(() {
            isFavorite = !isFavorite;
            favoritesController.toggle(widget.movie.id!,isFavorite);
          });
        },
      );
      }
    );
  }
}
