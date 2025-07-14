import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:inspire_me/core/constants/appurls.dart';
import 'package:inspire_me/core/network/api_service.dart';
import 'package:inspire_me/models/quotesmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServicesVm with ChangeNotifier {
  QuotesModel quotesModel = QuotesModel();
  bool iconfav = false;

  String quotes = '';
  List<QuotesModel> favQuotes = [];
  bool quotesloading = false;

  Future savetomodel() async {
    //loading(true);
    final result = await ApiService().getquotes(Appurls().quotesgeneratorbaseurl);

    quotesModel = result;
    iconfav = false;
    // loading(false);
    notifyListeners();
  }

  void loading(bool value) {
    quotesloading = value;
    notifyListeners();
  }

  Future<void> addToFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    favQuotes.add(quotesModel);

    List<String> favList = favQuotes.map((q) => jsonEncode(q.toJson())).toList();
    await prefs.setStringList('fav_quotes', favList);
    iconfav = true;
    notifyListeners();
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favList = prefs.getStringList('fav_quotes');

    if (favList != null) {
      favQuotes = favList.map((e) => QuotesModel.fromJson(jsonDecode(e))).toList();
      notifyListeners();
    }
  }
}
