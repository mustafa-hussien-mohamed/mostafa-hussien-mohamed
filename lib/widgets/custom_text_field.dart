import 'package:flutter/material.dart';

class custom_field extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  bool obscureText;
  String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
   custom_field({
    super.key,
    required this.hintText,
    this.obscureText=true,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon
      ),
    );
  }
}
