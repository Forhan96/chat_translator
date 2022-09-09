import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/components/default_navbar.dart';
import 'package:chat_translator/providers/search_provider.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:selection_dialogs/country_selector_dialog.dart';
import 'package:selection_dialogs/gender_selector_dialog.dart';
import 'package:selection_dialogs/language_selector_dialog.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    Map<String, dynamic> searchParameters = searchProvider.searchParameters;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // shadowColor: Colors.grey.withOpacity(0.2),
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.EDIT_PROFILE_SCREEN);
            },
            icon: const Icon(
              Icons.expand_circle_down_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DefaultContainer(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  DefaultContainer(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return GenderSelector(
                            onTap: (gender) {
                              searchProvider.searchParameters = {
                                "gender": gender,
                              };
                            },
                          );
                        },
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gender :"),
                        Text(searchParameters["gender"] != "" ? searchParameters["gender"] : "Select Gender"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  DefaultContainer(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LanguageSelector(
                            onTap: (language) {
                              searchProvider.searchParameters = {
                                "native_lang": language.name,
                              };
                            },
                          );
                        },
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Native :"),
                        Text(searchParameters["native_lang"] != "" ? searchParameters["native_lang"] : "Select Language"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  DefaultContainer(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LanguageSelector(
                            onTap: (language) {
                              searchProvider.searchParameters = {
                                "learning_lang": language.name,
                              };
                            },
                          );
                        },
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Learning :"),
                        Text(searchParameters["learning_lang"] != "" ? searchParameters["learning_lang"] : "Select Language"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  DefaultContainer(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CountrySelector(
                            onTap: (country) {
                              searchProvider.searchParameters = {
                                "country": country.name,
                              };
                            },
                          );
                        },
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Country :"),
                        Text(searchParameters["country"] != "" ? searchParameters["country"] : "Select Country"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultContainer(
                        onTap: () {
                          searchProvider.searchParameters = {
                            "gender": "",
                            "native_lang": "",
                            "learning_lang": "",
                            "country": "",
                          };
                        },
                        padding: EdgeInsets.all(10),
                        child: Text("Clear"),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      DefaultContainer(
                        onTap: () {
                          print(searchProvider.searchParameters);
                        },
                        padding: EdgeInsets.all(10),
                        child: Text("Search"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefaultNavBar(
        initialActiveIndex: 1,
      ),
    );
  }
}
