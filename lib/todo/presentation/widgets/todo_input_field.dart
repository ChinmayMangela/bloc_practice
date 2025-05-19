import 'package:flutter/material.dart';

class TodoInputField extends StatelessWidget {
  const TodoInputField({super.key, required this.controller, required this.hintText, required this.validator});
  
  final TextEditingController controller;
  final String hintText;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: _buildBorder(false),
        enabledBorder: _buildBorder(false),
        focusedBorder: _buildBorder(true)
      ),
    );
  }
  
  OutlineInputBorder _buildBorder(bool isFocusBorder) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.black,
        width: isFocusBorder ? 2 : 1 ,
      ),
    );
  }
}
