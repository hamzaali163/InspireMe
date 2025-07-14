import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspire_me/core/constants/appcolors.dart';
import 'package:inspire_me/firebase_options.dart';
import 'package:inspire_me/providers/api_services_vm.dart';
import 'package:inspire_me/providers/auth_vm.dart';
import 'package:inspire_me/providers/bottom_nav_vm.dart';
import 'package:inspire_me/providers/fav_provider.dart';
import 'package:inspire_me/routes/route_names.dart';
import 'package:inspire_me/routes/routes.dart';
import 'package:inspire_me/providers/theme_vm.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Size designSize = const Size(390, 844);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavVm()),
        ChangeNotifierProvider(create: (_) => ApiServicesVm()),
        ChangeNotifierProvider(create: (_) => ThemeVm()),
        ChangeNotifierProvider(create: (_) => AuthVm()),
        ChangeNotifierProvider(create: (_) => FavProvider()),
      ],
      child: ScreenUtilInit(
        designSize: designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Consumer<ThemeVm>(
            builder: (context, vm, _) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
                child: MaterialApp(
                  theme: ThemeData(
                    scaffoldBackgroundColor: AppColors.lightBackground,
                    appBarTheme: AppBarTheme(
                      backgroundColor: AppColors.lightCard,
                      foregroundColor: AppColors.lightTextPrimary,
                      elevation: 0,
                    ),
                  ),
                  darkTheme: ThemeData.dark().copyWith(
                    appBarTheme: AppBarTheme(
                      backgroundColor: AppColors.darkCard,
                      foregroundColor: AppColors.darkTextPrimary,
                      elevation: 0,
                    ),
                    scaffoldBackgroundColor: Colors.black,
                  ),
                  themeMode: vm.themeMode,
                  debugShowCheckedModeBanner: false,
                  themeAnimationDuration: const Duration(milliseconds: 500),
                  themeAnimationCurve: Curves.easeIn,
                  initialRoute: RouteNames.splashscreen,
                  onGenerateRoute: Generateroutes().generateroutes,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
