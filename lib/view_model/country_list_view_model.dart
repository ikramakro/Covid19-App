import 'package:api_boilerplate/data/response/api_response.dart';
import 'package:api_boilerplate/repository/countrylist_repository.dart';
import 'package:flutter/material.dart';

class CountryListViewModel with ChangeNotifier {
  final myrepo = CountryListRepositry();
  ApiResponse<List<dynamic>> countrylist = ApiResponse.loading();
  setCountryList(ApiResponse<List<dynamic>> response) {
    countrylist = response;
    notifyListeners();
  }

  Future<void> fetchCountryList() async {
    setCountryList(ApiResponse.loading());
    myrepo.getcountrylist().then((value) {
      setCountryList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      ApiResponse.error(error.toString());
    });
  }
}
