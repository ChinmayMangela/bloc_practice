import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onTap});

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 58,
        width: double.maxFinite,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFbf5af3)),
        child: Center(
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
