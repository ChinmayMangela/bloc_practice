import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 0.2),
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: Center(child: Text(label, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white
        ),), ),
      ),
    );
  }
}
