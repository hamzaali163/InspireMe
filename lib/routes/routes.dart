import 'package:flutter/material.dart';
import 'package:inspire_me/views/auth/login_screen.dart';
import 'package:inspire_me/views/auth/sign_up_screen.dart';
import 'package:inspire_me/views/auth/splash_screen.dart';
import 'package:inspire_me/views/bottomnavbar/bottom_nav.dart';
import 'package:inspire_me/views/favourites/favourites_screen.dart';
import 'package:inspire_me/views/home/homescreen.dart';
import 'package:provider/provider.dart';

import 'route_names.dart';

class Generateroutes {
  Route<dynamic> generateroutes(RouteSettings route) {
    switch (route.name) {
      case RouteNames.splashscreen:
        //  final args = route.arguments as Map<String, dynamic>?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ChangeNotifierProvider(create: (_) {}, child: const SplashScreen()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );

      case RouteNames.homescreen:
        //  final args = route.arguments as Map<String, dynamic>?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ChangeNotifierProvider(create: (_) {}, child: const HomeScreen()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );

      case RouteNames.favscreen:
        //  final args = route.arguments as Map<String, dynamic>?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ChangeNotifierProvider(create: (_) {}, child: const FavouritesScreen()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
      case RouteNames.loginscreen:
        //  final args = route.arguments as Map<String, dynamic>?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ChangeNotifierProvider(create: (_) {}, child: const LoginScreen()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );

      case RouteNames.signUpscreen:
        //  final args = route.arguments as Map<String, dynamic>?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ChangeNotifierProvider(create: (_) {}, child: const SignUpScreen()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
      case RouteNames.bottomnav:
        //  final args = route.arguments as Map<String, dynamic>?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ChangeNotifierProvider(create: (_) {}, child: BottomNavBarScreen()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Column(children: [Center(child: Text('error, no screen found'))]),
            );
          },
        );
    }
  }
}
