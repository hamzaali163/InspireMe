import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspire_me/core/constants/appcolors.dart';
import 'package:inspire_me/core/constants/components/round_button.dart';
import 'package:inspire_me/models/quotesmodel.dart';
import 'package:inspire_me/providers/api_services_vm.dart';
import 'package:inspire_me/providers/fav_provider.dart';
import 'package:inspire_me/providers/theme_vm.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuotesModel quotesModel = QuotesModel();

  @override
  void initState() {
    super.initState();
    Provider.of<ApiServicesVm>(context, listen: false).savetomodel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ApiServicesVm, ThemeVm, FavProvider>(
      builder: (context, vm, themevm, favvm, child) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                Switch(
                  activeTrackColor: AppColors.accent,
                  value: themevm.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    themevm.toggleTheme(value);
                  },
                ),
                SizedBox(width: 5.w),
                Text('Dark Mode'),
                SizedBox(width: 10.w),
              ],
            ),
            body: vm.quotesModel.quote == null
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'quotes',
                          child: Text(
                            vm.quotesModel.quote.toString(),
                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(vm.quotesModel.author.toString(), style: TextStyle(fontStyle: FontStyle.italic)),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final isFav = await favvm.isFavorite(vm.quotesModel);
                                if (isFav) {
                                  favvm.removeFromFavorites(vm.quotesModel);
                                } else {
                                  favvm.addToFavorites(vm.quotesModel);
                                }
                              },
                              icon: FutureBuilder<bool>(
                                future: favvm.isFavorite(vm.quotesModel),
                                builder: (context, snapshot) {
                                  final isFav = snapshot.data ?? false;
                                  return Icon(
                                    isFav ? Icons.favorite : Icons.favorite_border,
                                    color: isFav ? Colors.red : AppColors.accent,
                                  );
                                },
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                SharePlus.instance.share(
                                  ShareParams(text: 'quote: ${vm.quotesModel.quote}}, author:${vm.quotesModel.author}'),
                                );
                              },
                              icon: Icon(Icons.share, color: AppColors.accent),
                            ),
                          ],
                        ),
                        SizedBox(height: 100.h),

                        RoundButton(
                          loading: vm.quotesloading,
                          text: 'Inspire Me',
                          onPressed: () {
                            vm.savetomodel();
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
