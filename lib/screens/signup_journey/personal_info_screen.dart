import 'package:chat_translator/components/app_text_field.dart';
import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/utils/calculators.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
              InkWell(
                onTap: () {
                  _showDatePicker(context);
                },
                child: DefaultContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                    horizontal: 16.w,
                  ),
                  child: Text(
                    "Date of Birth",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  _showGenderOptions(context);
                },
                child: DefaultContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                    horizontal: 16.w,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Text(
                      "Sex",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                  label: 'Bio',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    final dateValue = Calculators().getPrevDate(14);
    // controllerDate = _currentUser().birthDate as DateTime;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
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
              // setState(() {
              //   _birthDateController.text = DateFormat('dd MMMM, yyyy').format(value as DateTime);
              //   controllerDate = value;
              //   // updateData.add({"field": "birthDate", "value": value});
              // });
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

  void _showGenderOptions(BuildContext context) {
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
              InkWell(
                onTap: () {
                  // setState(() {
                  //   _genderValueController.text = "Male";
                  //   _genderController.text = AppLocalizations.of(context)!.male;
                  // });
                  Navigator.pop(context);
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
                    leading: const Icon(
                      Icons.male_outlined,
                      size: 24,
                    ),
                    // selected: isSelected,
                    title: Text(
                      "Male",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // setState(() {
                  //   _genderValueController.text = "Female";
                  //   _genderController.text = AppLocalizations.of(context)!.female;
                  // });
                  Navigator.pop(context);
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
                    leading: const Icon(
                      Icons.female_outlined,
                      size: 24,
                    ),
                    // selected: isSelected,
                    title: Text(
                      "Female",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // setState(() {
                  //   _genderValueController.text = "Rather not say";
                  //   _genderController.text = AppLocalizations.of(context)!.rather_not_say;
                  // });
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 10,
                    // bottom: 16,
                  ),
                  padding: const EdgeInsets.symmetric(
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
                    leading: const Icon(
                      Icons.radio_button_off_outlined,
                      size: 24,
                    ),
                    // selected: isSelected,
                    title: Text(
                      "Rather Not Say",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
