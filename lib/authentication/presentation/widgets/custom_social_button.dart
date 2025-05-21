import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key, required this.label, required this.onTap, required this.buttonColor, required this.icon});

  final String label;
  final void Function() onTap;
  final Color buttonColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
