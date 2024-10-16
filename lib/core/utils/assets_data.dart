import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
enum AssetsData {
  profileAvatar('profile_avatar.jpg'),
  imageTile1('image_tile1.jpg'),
  imageTile2('image_tile2.jpeg'),
  imageTile3('image_tile3.jpeg'),
  imageTile4('image_tile4.jpg');

  final String path;

  const AssetsData(this.path);

  String get absolutePath => 'assets/images/$path';

  Widget svgPicture({
    double? height,
    double? width,
    Color? color,
  }) =>
      SvgPicture.asset(
        absolutePath,
        height: height,
        width: width,
        colorFilter: color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
      );

  Widget get pngPicture => Image.asset(absolutePath);

  Widget jpgPicture({BoxFit? fit}) {
    return Image.asset(absolutePath, fit: fit);
  }
}
