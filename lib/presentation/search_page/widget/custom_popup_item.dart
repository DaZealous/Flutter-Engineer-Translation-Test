import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPopup extends ConsumerWidget {
  const CustomPopup(
      {super.key,
      required this.index,
      required this.title,
      required this.imagePath});

  final int index;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          height: 20,
          width: 20,
          colorFilter:
              const ColorFilter.mode(AppColors.accent, BlendMode.srcIn),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: AppColors.accent),
        ),
      ],
    );
  }
}
