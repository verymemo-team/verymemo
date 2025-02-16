import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'memo_images_carousel.dart';
import 'memo_images_grid.dart';

class MemoImages extends StatelessWidget {
  final List<String> imageUrls;

  const MemoImages({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktopPlatform =
        kIsWeb || Platform.isWindows || Platform.isLinux || Platform.isMacOS;

    return isDesktopPlatform
        ? MemoImagesGrid(imageUrls: imageUrls)
        : MemoImagesCarousel(imageUrls: imageUrls);
  }
}
