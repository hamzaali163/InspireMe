import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspire_me/core/constants/appcolors.dart';
import 'package:inspire_me/providers/bottom_nav_vm.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavVm>(
      builder: (context, vm, child) {
        return Scaffold(
          body: vm.screens[vm.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : AppColors.lightCard,

              type: BottomNavigationBarType.fixed,
              currentIndex: vm.currentIndex,
              selectedItemColor: AppColors.accent,
              unselectedItemColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey : Color(0xff888888),
              onTap: (value) {
                vm.setcurrentindex(value);
              },

              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 7.h),
                    child: Icon(Icons.home, size: 24.sp),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 7.h),
                    child: Icon(Icons.calendar_month, size: 24.sp),
                  ),
                  label: 'Favourites',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
