import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:inspire_me/core/utils/general_utils.dart';
import 'package:inspire_me/models/quotesmodel.dart';

class ApiService {
  Future<dynamic> getquotes(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'X-Api-Key': 'nsq8Sa6yQQ+qZNcNtvaNuA==6jEKuGJQnUoNchiB'},
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final decodeddata = jsonDecode(response.body);

        final model = QuotesModel.fromJson(decodeddata[0]);

        print(model.quote);
        return QuotesModel.fromJson(decodeddata[0]);
      } else {
        return null;
      }
    } on SocketException {
      //  return Generalutils().errorflushbar(context, 'No internet connection. Please check your network.');
    } catch (e) {
      //  return Generalutils().errorflushbar(context, 'An unexpected error occurred.');
    }
  }
}

Future<void> apiexceptions(int statuscode, context) {
  switch (statuscode) {
    case 400:
      return Generalutils().errorflushbar(context, 'Something went wrong with your request');
    case 401:
      return Generalutils().errorflushbar(context, 'You are not authorized. Please log in again');
    case 403:
      return Generalutils().errorflushbar(context, 'Access denied. You don’t have permission');
    case 404:
      return Generalutils().errorflushbar(context, 'We couldn’t find what you were looking for.');
    case 409:
      return Generalutils().errorflushbar(context, 'This action conflicts with existing data');
    case 500:
      return Generalutils().errorflushbar(context, 'Server error. Please try again later');
    default:
      return Generalutils().errorflushbar(context, 'An unexpected error occurred');
  }
}
