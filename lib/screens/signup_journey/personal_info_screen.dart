import 'package:chat_translator/components/app_text_field.dart';
import 'package:chat_translator/components/default_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h,
          ),
          child: Column(
            children: [
              DefaultContainer(
                padding: EdgeInsets.all(10),
                child: TextInputField(
                  prefix: null,
                  controller: _nameController,
                  label: 'Name',
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              DefaultContainer(
                padding: EdgeInsets.all(10),
                child: TextInputField(
                  prefix: null,
                  controller: _nameController,
                  label: 'Email',
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              DefaultContainer(
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                  horizontal: 16.w,
                ),
                child: Text("Date of Birth"),
              ),
              SizedBox(
                height: 8.h,
              ),
              DefaultContainer(
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                  horizontal: 16.w,
                ),
                child: Text("Sex"),
              ),
              SizedBox(
                height: 8.h,
              ),
              DefaultContainer(
                padding: EdgeInsets.all(10),
                child: TextInputField(
                  prefix: null,
                  controller: _nameController,
                  label: 'Bio',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
