import 'package:fl_cinemapedia/presentation/views/movies/favorites_view.dart';
import 'package:flutter/material.dart';
import 'package:fl_cinemapedia/presentation/widgets/widgets.dart';

import '../../views/movies/home_view.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final viewRouters = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRouters,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
