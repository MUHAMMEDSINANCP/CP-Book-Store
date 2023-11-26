import 'package:flutter/material.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const RoundTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          labelStyle: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
