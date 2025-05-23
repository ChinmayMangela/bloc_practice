import 'package:bloc_practice/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.child});

  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 58,
        width: double.maxFinite,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: authButtonColor),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
