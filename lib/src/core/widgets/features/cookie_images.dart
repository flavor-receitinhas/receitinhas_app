import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CookieImages extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CookieImages({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (image == null || image!.isEmpty) {
      return Image.asset(ImagesEnum.eggImageNotFound.path);
    }

    return CachedNetworkImage(
      imageUrl: image!,
      placeholder:
          (context, url) =>
              const CookieShimmerEffect(height: 150, width: double.infinity),
      errorWidget:
          (context, url, error) => Image.asset(ImagesEnum.eggError.path),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
