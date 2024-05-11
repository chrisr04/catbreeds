import 'package:flutter/material.dart';

class AppAssetImage extends StatelessWidget {
  const AppAssetImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
