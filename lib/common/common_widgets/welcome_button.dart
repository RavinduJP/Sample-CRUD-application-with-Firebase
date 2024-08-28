import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton(
      {super.key, this.buttonText, this.color, this.textColor, this.onTap});

  final String? buttonText;
  final Color? color;
  final Color? textColor;
  final Widget? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
          ),
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: textColor!,
          ),
        ),
      ),
    );
  }
}
