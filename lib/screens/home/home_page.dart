import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/screens/favorite/favorites.dart';
import 'package:the_movie_db/screens/movies_home/movies_home.dart';
import 'package:the_movie_db/screens/trending/trending.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const MoviesHome(),
    const Trending(),
    const Favorites(),
  ];

  onTapNav(int index) {
    if(index != 1){
      setState(() {
        _selectedIndex = index;
      });
    }else{
      Get.toNamed(RouteHelper.getTrending());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor2,
        unselectedItemColor: AppColors.whiteColor,
        showUnselectedLabels: false,
        backgroundColor: AppColors.mainColor,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_movies_outlined),
              label: "Movies"
          ),
          BottomNavigationBarItem(
              icon:  Icon(Icons.local_fire_department_sharp),
              label: "Trending"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: "Favorites"
          ),
        ],
      ),
    );
  }
}
