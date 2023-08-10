import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({
    Key? key,
    required this.iconData,
    this.isSelected = false,
  }) : super(key: key);

  final IconData iconData;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isSelected ? kSecondaryColor : kPrimaryColor;
    final Color iconColor = isSelected ? kPrimaryColor : kSecondaryColor;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0.w,
            color: kSecondaryColor,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: bgColor,
          radius: kBorderRadius,
          child: Icon(
            iconData,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
