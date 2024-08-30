import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.lableText,
      required this.hintText,
      this.icon,
      required this.isObsecureText,
      this.keyboardType,
      required this.controller,
      this.validateMessage});

  final String lableText;
  final String hintText;
  final IconData? icon;
  final bool isObsecureText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? validateMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecureText,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        label: Text(lableText),
        prefixIcon: Icon(
          icon!,
          color: Colors.black.withOpacity(0.3),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateMessage;
        }
        return null;
      },
    );
  }
}
