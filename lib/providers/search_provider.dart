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
}
