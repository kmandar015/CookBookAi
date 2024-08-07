import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool obsecureText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  const CustomTextField(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      required this.obsecureText,
      required this.padding,
      required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '$title',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(color: ColorConstant.primaryExtraSoft, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 14),
              cursorColor: ColorConstant.primary,
              obscureText: obsecureText,
              decoration: InputDecoration(
                hintText: '$hint',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                contentPadding: const EdgeInsets.only(left: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
