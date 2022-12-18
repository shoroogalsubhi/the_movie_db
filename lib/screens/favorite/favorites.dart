import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      body: const Text("Favorites Hello"),
    );
  }
}
