import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/providers/image_change_provider.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileImageScreen extends StatelessWidget {
  const ProfileImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.2),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryColor,
          ),
        ),
        title: const Text(
          "Change Profile Image",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Consumer<ImageChangeProvider>(
        builder: (context, imageChangeProvider, child) {
          return SafeArea(
            child: Container(
              height: 250,
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
              child: DefaultContainer(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          imageSourcePicker(context);
                        },
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 56,
                              backgroundColor: AppColors.primaryColor,
                              child: ClipOval(
                                child: imageChangeProvider.imageChanged
                                    ? Image.file(
                                        imageChangeProvider.finalFile,
                                        fit: BoxFit.cover,
                                        width: 108,
                                        height: 108,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: "https://picsum.photos/200",
                                        fit: BoxFit.cover,
                                        width: 108,
                                        height: 108,
                                      ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 12.h,
                    ),
                    DefaultContainer(
                      onTap: () async {
                        if (!imageChangeProvider.imageChanged) {
                          final snackBar = SnackBar(
                            backgroundColor: AppColors.errorColor,
                            content: Text(
                              "Please select an image",
                              textAlign: TextAlign.center,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                        imageChangeProvider.uploadUserAvatar(imageChangeProvider.finalFile);
                      },
                      padding: EdgeInsets.all(16),
                      color: AppColors.primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload Image",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> imageSourcePicker(BuildContext context) async {
    ImageChangeProvider imageChangeProvider = Provider.of<ImageChangeProvider>(context, listen: false);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0xff278EA5),
                  size: 32,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _getImage(context, ImageSource.camera, imageChangeProvider);
                },
              ),
              const SizedBox(
                height: 40,
                child: VerticalDivider(
                  color: Color(0xff278EA5),
                  // thickness: 1.0,
                  thickness: 0.5,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.photo_size_select_actual_outlined,
                  color: Color(0xff278EA5),
                  size: 32,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _getImage(context, ImageSource.gallery, imageChangeProvider);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImage(BuildContext context, ImageSource source, ImageChangeProvider imageChangeProvider) async {
    final picker = ImagePicker();
    await picker.pickImage(source: source, imageQuality: 60).then((image) async {
      if (image != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(
              title: 'Cropper',
            ),
          ],
        );
        imageChangeProvider.finalFile = File(croppedFile?.path ?? image.path);
        imageChangeProvider.imageChanged = true;
      }
    });
  }
}
