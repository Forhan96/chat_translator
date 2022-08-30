import 'package:chat_translator/components/default_navbar.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile"),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.PERSONAL_INFO_SCREEN);
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefaultNavBar(
        initialActiveIndex: 2,
      ),
    );
  }
}
