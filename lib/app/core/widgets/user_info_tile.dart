import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';


class UserInfoTile extends StatelessWidget {
  final String label, value;
  final EdgeInsetsGeometry margin, padding;
  final Color valueBackground;
  const UserInfoTile({super.key, required this.label, required this.value, required this.margin, required this.padding, required this.valueBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('$label', style: TextStyle(color: ColorConstant.primary, fontSize: 12)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            color: valueBackground ?? ColorConstant.primaryExtraSoft,
            child: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
