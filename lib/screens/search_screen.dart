import 'package:chat_translator/components/default_navbar.dart';
import 'package:chat_translator/providers/auth_provider.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Search"),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).signOut();
                Navigator.pushReplacementNamed(context, Routes.AUTH_WRAPPER);
              },
              child: Text("Sign out"),
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
