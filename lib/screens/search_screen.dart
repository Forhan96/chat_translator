import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/components/default_navbar.dart';
import 'package:chat_translator/providers/search_provider.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
                        padding: EdgeInsets.all(10),
                        child: Text("Clear"),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      InkWell(
                        onTap: () {
                          searchProvider.searchParameters = {
                            "gender": "Male",
                            "country": "Male",
                          };
                        },
                        child: DefaultContainer(
                          padding: EdgeInsets.all(10),
                          child: Text("Search"),
                        ),
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
