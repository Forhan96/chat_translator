import 'package:chat_translator/components/animations/loading_animation.dart';
import 'package:chat_translator/components/app_text_field.dart';
import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/models/user.dart';
import 'package:chat_translator/providers/auth_provider.dart';
import 'package:chat_translator/providers/personal_info_provider.dart';
import 'package:chat_translator/utils/calculators.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:chat_translator/utils/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with InputValidationMixin {
  late AuthProvider authProvider;
  late PersonalInfoProvider personalInfoProvider;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController sexValueController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  // DateTime? birthDate;
  UserData? userData;
  late Object date;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    personalInfoProvider = Provider.of<PersonalInfoProvider>(context, listen: false);
    personalInfoProvider.getUserData(authProvider.uid() ?? "");
    userData = personalInfoProvider.userData;
    if (userData != null) {
      nameController.text = userData?.name ?? "";
      emailController.text = userData?.email ?? "";
      dobController.text = DateFormat('dd MMMM, yyyy').format(userData?.birthDate ?? DateTime.now());
      date = userData?.birthDate as Object;
      sexValueController.text = userData?.sex ?? "";
      bioController.text = userData?.bio ?? "";
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.2),
        title: const Text(
          "Personal Info",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // UserData userData = UserData(id: authProvider.uid() ?? "");
          userData?.name = nameController.text;
          userData?.email = emailController.text;
          userData?.birthDate = date as DateTime?;
          userData?.sex = sexValueController.text;
          userData?.bio = bioController.text;
          if (formKey.currentState!.validate()) {
            print(userData);
            await personalInfoProvider.setUserData(userData!);
            Navigator.pop(context);
          }
        },
        label: Row(
          children: const [
            Text("Save"),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: personalInfoProvider.loading
          ? const Center(
              child: Loader(),
            )
          : SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      DefaultContainer(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultContainer(
                              padding: const EdgeInsets.all(10),
                              child: TextInputField(
                                controller: nameController,
                                validator: (name) {
                                  if (isValidName(name ?? "")) {
                                    return null;
                                  } else {
                                    return 'Enter a valid name';
                                  }
                                },
                                label: 'Name',
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultContainer(
                              padding: const EdgeInsets.all(10),
                              child: TextInputField(
                                controller: emailController,
                                validator: (email) {
                                  if (isEmailValid(email ?? "")) {
                                    return null;
                                  } else {
                                    return 'Enter a valid email address';
                                  }
                                },
                                label: 'Email',
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            InkWell(
                              onTap: () {
                                _showDatePicker(context, controller: dobController);
                              },
                              child: DefaultContainer(
                                padding: const EdgeInsets.all(10),
                                child: TextInputField(
                                  controller: dobController,
                                  validator: (dob) {
                                    if (isNotEmpty(dob ?? "")) {
                                      return null;
                                    } else {
                                      return 'Provide Date of Birth';
                                    }
                                  },
                                  label: 'Date of Birth',
                                  enabled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            InkWell(
                              onTap: () {
                                _showGenderOptions(context, controller: sexValueController);
                              },
                              child: DefaultContainer(
                                padding: const EdgeInsets.all(10),
                                child: TextInputField(
                                  controller: sexValueController,
                                  validator: (sex) {
                                    if (isNotEmpty(sex ?? "")) {
                                      return null;
                                    } else {
                                      return 'Select your sex';
                                    }
                                  },
                                  label: 'Sex',
                                  enabled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultContainer(
                              padding: const EdgeInsets.all(10),
                              child: TextInputField(
                                controller: bioController,
                                label: 'Bio',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      DefaultContainer(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _showDatePicker(context, controller: dobController);
                              },
                              child: DefaultContainer(
                                padding: const EdgeInsets.all(10),
                                child: TextInputField(
                                  controller: dobController,
                                  validator: (dob) {
                                    if (isNotEmpty(dob ?? "")) {
                                      return null;
                                    } else {
                                      return 'Provide Date of Birth';
                                    }
                                  },
                                  label: 'Date of Birth',
                                  enabled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            InkWell(
                              onTap: () {
                                _showDatePicker(context, controller: dobController);
                              },
                              child: DefaultContainer(
                                padding: const EdgeInsets.all(10),
                                child: TextInputField(
                                  controller: dobController,
                                  validator: (dob) {
                                    if (isNotEmpty(dob ?? "")) {
                                      return null;
                                    } else {
                                      return 'Provide Date of Birth';
                                    }
                                  },
                                  label: 'Date of Birth',
                                  enabled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            InkWell(
                              onTap: () {
                                _showDatePicker(context, controller: dobController);
                              },
                              child: DefaultContainer(
                                padding: const EdgeInsets.all(10),
                                child: TextInputField(
                                  controller: dobController,
                                  validator: (dob) {
                                    if (isNotEmpty(dob ?? "")) {
                                      return null;
                                    } else {
                                      return 'Provide Date of Birth';
                                    }
                                  },
                                  label: 'Date of Birth',
                                  enabled: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _showDatePicker(BuildContext context, {required TextEditingController controller}) {
    final dateValue = Calculators().getPrevDate(14);
    // controllerDate = _currentUser().birthDate as DateTime;
    showModalBottomSheet<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return Container(
          height: 350,
          color: Theme.of(context).canvasColor,
          padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 6.0, bottom: 2.0),
          child: SfDateRangePicker(
            backgroundColor: Theme.of(context).canvasColor,
            todayHighlightColor: AppColors.primaryColor,
            selectionColor: AppColors.primaryColor,
            maxDate: dateValue.toDate(),
            minDate: Calculators().getPrevDate(100).toDate(),
            view: DateRangePickerView.decade,
            showNavigationArrow: true,
            showActionButtons: true,
            onCancel: () {
              Navigator.pop(context);
            },
            onSubmit: (Object? value) {
              controller.text = DateFormat('dd MMMM, yyyy').format(value as DateTime);
              date = value;
              Navigator.pop(context);
            },
            headerStyle: DateRangePickerHeaderStyle(
              textStyle: Theme.of(context).textTheme.headline6,
            ),
          ),
        );
      },
    );
  }

  void _showGenderOptions(BuildContext context, {required TextEditingController controller}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 280.h,
          color: Theme.of(context).canvasColor,
          // padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 10.0),
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sex",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  // color: kUiGrey4,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              GenderSelectionTile(
                onTap: () {
                  controller.text = "Male";
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.male_outlined,
                  size: 24,
                ),
                text: 'Male',
              ),
              GenderSelectionTile(
                onTap: () {
                  controller.text = "Female";
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.female_outlined,
                  size: 24,
                ),
                text: 'Female',
              ),
              GenderSelectionTile(
                onTap: () {
                  controller.text = "Rather not say";
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.radio_button_off_outlined,
                  size: 24,
                ),
                text: "Rather not say",
              ),
            ],
          ),
        );
      },
    );
  }
}

class GenderSelectionTile extends StatelessWidget {
  final Function onTap;
  final Icon leading;
  final String text;
  const GenderSelectionTile({
    Key? key,
    required this.onTap,
    required this.leading,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          // bottom: 16,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xffC2C2C2,
              ).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
          ),
        ),
      ),
    );
  }
}