import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_translator/components/animations/loading_animation.dart';
import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/components/default_navbar.dart';
import 'package:chat_translator/providers/auth_provider.dart';
import 'package:chat_translator/providers/personal_info_provider.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  // AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    PersonalInfoProvider personalInfoProvider = Provider.of<PersonalInfoProvider>(context);
    personalInfoProvider.getUserData(authProvider.uid() ?? "");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // shadowColor: Colors.grey.withOpacity(0.2),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        // leading: Icon(
        //   Icons.account_balance_sharp,
        //   color: Colors.black,
        // ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.EDIT_PROFILE_SCREEN);
            },
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
          // Icon(
          //   Icons.edit,
          //   color: Colors.black,
          // )
        ],
      ),
      body: SafeArea(
        child: personalInfoProvider.loading
            ? Center(child: Loader())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DefaultContainer(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: AppColors.primaryColor,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: "https://picsum.photos/200",
                                fit: BoxFit.cover,
                                width: 56,
                                height: 56,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                personalInfoProvider.userData?.name ?? "",
                                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                personalInfoProvider.userData?.email ?? "",
                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                personalInfoProvider.userData?.bio ?? "",
                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    DefaultContainer(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Date of Birth",
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  DateFormat('dd MMMM, yyyy').format(personalInfoProvider.userData?.birthDate ?? DateTime.now()),
                                  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Sex",
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  personalInfoProvider.userData?.sex ?? "",
                                  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    DefaultContainer(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Native",
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  personalInfoProvider.userData?.nativeLanguage ?? "",
                                  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Learning",
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  personalInfoProvider.userData?.learningLanguage ?? "",
                                  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: DefaultNavBar(
        initialActiveIndex: 2,
      ),
    );
  }
}
