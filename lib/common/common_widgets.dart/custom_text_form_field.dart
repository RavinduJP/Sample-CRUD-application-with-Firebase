import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.character,
      required this.lableText,
      required this.hintText,
      this.icon,
      required this.isObsecureText});

  final String lableText;
  final String hintText;
  final IconData? icon;
  final bool isObsecureText;
  final String? character;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      obscuringCharacter: character!,
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
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
