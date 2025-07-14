import 'package:flutter/material.dart';
import 'package:inspire_me/views/favourites/favourites_screen.dart';
import 'package:inspire_me/views/home/homescreen.dart';

import '../routes/route_names.dart';

class BottomNavVm with ChangeNotifier {
  int currentIndex = 0;
  final screens = [HomeScreen(), FavouritesScreen()];

  void setcurrentindex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  //profile screen
  void logout(BuildContext context) async {
    currentIndex = 0;

    Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.bottomnav, (route) => false);
  }
}
