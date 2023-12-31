import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/drawable/app_drawable.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class ImageBaseWidget extends StatelessWidget {
  const ImageBaseWidget({
    super.key,
    required this.imageType,
    this.imageUrl = "",
    this.imageFile,
    this.imageWidth,
    this.imageHeight,
    this.boxFit = BoxFit.cover,
    this.imgNotFoundUrl,
    this.imgColor,
  });
  final ImageTypeEnum imageType;
  final String imageUrl;
  final File? imageFile;
  final double? imageWidth;
  final double? imageHeight;
  final String? imgNotFoundUrl;
  final BoxFit boxFit;
  final Color? imgColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: imageWidth,
      child: imageUrl.isEmpty ? _errorWidget() : _imageBodyWidget(),
    );
  }

  Widget _imageBodyWidget() {
    switch (imageType) {
      case ImageTypeEnum.cachedNetWork:
        return CachedNetworkImage(
          imageUrl: imageUrl,
          width: imageWidth,
          height: imageHeight,
          fit: boxFit,
          placeholder: (context, url) => const LoadingIconBase(),
          errorWidget: (context, url, errorWidget) => _errorWidget(),
        );
      case ImageTypeEnum.assetFile:
        return Image.asset(
          imageUrl,
          width: imageWidth,
          height: imageHeight,
          fit: boxFit,
          errorBuilder: (context, error, stackTrace) => _errorWidget(),
        );
      case ImageTypeEnum.svgPicture:
        return SvgPicture.asset(
          imageUrl,
          width: imageWidth,
          height: imageHeight,
          colorFilter: imgColor != null ? ColorFilter.mode(imgColor!, BlendMode.srcIn) : null,
          placeholderBuilder: (context) => _errorWidget(),
        );
      case ImageTypeEnum.file: //don't use, using later if necessary
        return Image.file(
          File(imageUrl),
          fit: boxFit,
        );
      default:
        //return _errorWidget();
        return const Icon(Icons.error);
    }
  }

  Widget _errorWidget() {
    return Image.asset(
      imgNotFoundUrl ?? AppDrawable().imgNoImage,
      fit: boxFit,
      errorBuilder: (context, error, stackTrace) => _errorWidget(),
    );
  }
}
