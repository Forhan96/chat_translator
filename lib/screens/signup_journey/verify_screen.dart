import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130.h,
                ),
                const Icon(
                  Icons.message_rounded,
                  size: 64,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "Almost Done",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 28, color: Colors.grey[900]),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "We've sent an email to",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey[400]),
                ),
                Text(
                  "****************",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey[800]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    "Please check your junk/spam folder if needed.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey[400]),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: Text("You'll be automatically redirected after verifying your email",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey[400])),
            )
          ],
        ),
      ),
    );
  }
}
