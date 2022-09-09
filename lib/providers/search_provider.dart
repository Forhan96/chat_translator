import 'package:flutter/cupertino.dart';

class SearchProvider with ChangeNotifier {
  bool _loading = false;
  Map<String, dynamic> _searchParameters = {
    "gender": "",
    "native_lang": "",
    "learning_lang": "",
    "country": "",
  };

  bool get loading => _loading;

  Map<String, dynamic> get searchParameters => _searchParameters;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set searchParameters(Map<String, dynamic> updateData) {
    updateData.forEach((key, data) {
      _searchParameters.update(key, (value) => data);
    });
    notifyListeners();
  }

  void performSearch() {
    String baseUrl = "";
    searchParameters.forEach(
      (field, value) {
        if (value != "") {
          if (field == "native_lang") {
            baseUrl = '$baseUrl&native_lang=$value';
          } else if (field == "learning_lang") {
            baseUrl = '$baseUrl&learning_lang=$value';
          } else if (field == "country") {
            baseUrl = '$baseUrl&country=$value';
          } else if (field == "gender") {
            baseUrl = '$baseUrl&gender=$value';
          } else if (field == "age_range") {
            baseUrl = '$baseUrl&age_range=$value';
          } else {
            baseUrl = '$baseUrl&$field=$value';
          }
        }
      },
    );

    debugPrint(baseUrl);
  }
}
