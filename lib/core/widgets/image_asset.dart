import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius borderRadius;

  const ImageAsset(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
    final BorderRadius? borderRadius,
  }) : borderRadius = borderRadius ?? BorderRadius.zero;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        assetName,
        width: width,
        height: height,
        color: color,
        fit: fit,
      ),
    );
  }
}
