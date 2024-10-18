import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
enum AssetsData {
  profileAvatar('images/profile_avatar.jpg'),
  imageTile1('images/image_tile1.jpg'),
  imageTile2('images/image_tile2.jpeg'),
  imageTile3('images/image_tile3.jpeg'),
  imageTile4('images/image_tile4.jpg'),
  searchIcon('icons/search_icon.svg'),
  searchIconFilled('icons/search_icon_filled.svg'),
  chatIcon('icons/chat_icon.svg'),
  homeIcon('icons/home_icon.svg'),
  favoriteIcon('icons/favorite_icon.svg'),
  userIcon('icons/user_icon.svg'),
  filterList('icons/filter_list.svg'),
  filterIcon('icons/filter_icon.svg'),
  locationUp('icons/location-up.svg'),
  verifyIcon('icons/verify_icon.svg'),
  walletIcon('icons/wallet-icon.svg'),
  infrastructureIcon('icons/infrastructure_icon.svg'),
  layersIcon('icons/layers_icon.svg');

  final String path;

  const AssetsData(this.path);

  String get absolutePath => 'assets/$path';

  Widget svgPicture({
    double? height,
    double? width,
    Color? color,
  }) =>
      SvgPicture.asset(
        absolutePath,
        height: height ?? 25,
        width: width ?? 25,
        colorFilter: color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
      );

  Widget get pngPicture => Image.asset(absolutePath);

  Widget jpgPicture({BoxFit? fit}) {
    return Image.asset(absolutePath, fit: fit);
  }

}
