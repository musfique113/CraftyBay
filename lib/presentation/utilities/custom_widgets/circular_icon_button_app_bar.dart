import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 16,
        child: Icon(
          color: Colors.grey,
          iconData,
          size: 18,
        ),
      ),
    );
  }
}
