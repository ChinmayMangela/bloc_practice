import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.isPasswordField,
    this.validator,
    this.togglePasswordState, required this.hintText,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final void Function()? togglePasswordState;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white
      ),
      controller:  controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: _buildSuffixIcon(),
        border: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
        filled: true,
        fillColor: Color(0xFF252428),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }

  Widget? _buildSuffixIcon() {
    return isPasswordField
        ? IconButton(
          onPressed: togglePasswordState,
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey.shade400,),
        )
        : null;
  }
}
