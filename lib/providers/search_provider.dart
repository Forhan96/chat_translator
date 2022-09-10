import 'package:chat_translator/services/repository_service.dart';
import 'package:flutter/cupertino.dart';

class SearchProvider with ChangeNotifier {
  final RepositoryService _repositoryService = RepositoryService();

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

  Future<void> performSearch() async {
    _repositoryService.performSearch(_searchParameters);

    // var documents;
    //
    // debugPrint(baseUrl);
    // var response = await http.get(Uri.parse(baseUrl));
    //
    // if (response.statusCode == 200) {
    //   documents = jsonDecode(response.body)['data'];
    // } else {
    //   documents = [];
    // }
    //
    // print(documents);
  }
}
