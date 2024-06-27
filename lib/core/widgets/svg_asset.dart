import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final EdgeInsets? padding;

  const SvgAssets(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.color,
    final BoxFit? fit,
    this.padding,
  }) : fit = fit ?? BoxFit.contain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit,
      ),
    );
  }
}
