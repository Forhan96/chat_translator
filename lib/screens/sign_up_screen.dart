import 'package:chat_translator/components/default_button.dart';
import 'package:chat_translator/components/default_text_field.dart';
import 'package:chat_translator/providers/auth_provider.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextField(
              controller: emailController,
              hintText: "Email",
            ),
            SizedBox(
              height: 16.h,
            ),
            DefaultTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            DefaultButton(
              text: "Sign Up",
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).signUp(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.SIGN_IN_SCREEN);
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: kBrandBlue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
