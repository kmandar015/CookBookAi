import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showProfilePhoto;
  final ImageProvider profilePhoto;
  final Function profilePhotoOnPressed;
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.showProfilePhoto,
      required this.profilePhoto,
      required this.profilePhotoOnPressed});
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // brightness: Brightness.dark,
      automaticallyImplyLeading:false,
      backgroundColor: ColorConstant.primary,
      title: title,
      elevation: 0,
      iconTheme:const IconThemeData(
        color: Colors.white,
      ),
      actions: [
        Visibility(
          visible: showProfilePhoto,
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                profilePhotoOnPressed();
              },
              icon: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  image:
                      DecorationImage(image: profilePhoto, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
