import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Map<String, String>? httpHeaders;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, DownloadProgress)? progressIndicatorBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Duration fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final bool matchTextDirection;
  final bool useOldImageOnUrlChange;
  final Color? color;
  final FilterQuality filterQuality;
  final BlendMode? colorBlendMode;
  final Duration? placeholderFadeInDuration;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final String? cacheKey;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final BorderRadius borderRadius;

  const AppNetworkImage({super.key,
    required this.imageUrl,
    this.httpHeaders,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    final Duration? fadeOutDuration,
    final Curve? fadeOutCurve,
    final Duration? fadeInDuration,
    final Curve? fadeInCurve,
    this.width,
    this.height,
    this.fit,
    final AlignmentGeometry? alignment,
    final ImageRepeat? repeat,
    final bool? matchTextDirection,
    final bool? useOldImageOnUrlChange,
    this.color,
    final FilterQuality? filterQuality,
    final BorderRadius? borderRadius,
    this.colorBlendMode,
    this.placeholderFadeInDuration,
    this.memCacheWidth,
    this.memCacheHeight,
    this.cacheKey,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
  })  : fadeOutDuration = fadeOutDuration ?? const Duration(milliseconds: 1000),
        fadeOutCurve = fadeOutCurve ?? Curves.easeOut,
        fadeInDuration = fadeInDuration ?? const Duration(milliseconds: 500),
        fadeInCurve = fadeInCurve ?? Curves.easeIn,
        alignment = alignment ?? Alignment.center,
        repeat = repeat ?? ImageRepeat.noRepeat,
        matchTextDirection = matchTextDirection ?? false,
        useOldImageOnUrlChange = useOldImageOnUrlChange ?? false,
        filterQuality = filterQuality ?? FilterQuality.low,
        borderRadius = borderRadius ?? BorderRadius.zero;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Center(
          child: placeholder?.call(context, imageUrl) ?? const CircularProgressIndicator());
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        httpHeaders: httpHeaders,
        placeholder: placeholder,
        progressIndicatorBuilder: progressIndicatorBuilder,
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        maxWidthDiskCache: maxWidthDiskCache,
        matchTextDirection: matchTextDirection,
        width: width,
        errorWidget: errorWidget,
        maxHeightDiskCache: maxHeightDiskCache,
        placeholderFadeInDuration: placeholderFadeInDuration,
        fadeInCurve: fadeInCurve,
        fadeOutCurve: fadeOutCurve,
        filterQuality: filterQuality,
        fit: fit,
        height: height,
        memCacheWidth: memCacheWidth,
        repeat: repeat,
        useOldImageOnUrlChange: useOldImageOnUrlChange,
        imageBuilder: imageBuilder,
        memCacheHeight: memCacheHeight,
        key: key,
        cacheKey: cacheKey,
        color: color,
        colorBlendMode: colorBlendMode,
      ),
    );
  }
}
