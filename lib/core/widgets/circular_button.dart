import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor,iconColor;
  final IconData iconData;
  final double size;

  const CircularIconButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.iconData,
    this.iconColor=Colors.black,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            size: size,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
