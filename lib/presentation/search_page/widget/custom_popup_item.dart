import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPopup extends ConsumerWidget {
  const CustomPopup(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.imagePath});

  final bool isSelected;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          height: 25,
          width: 25,
          colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primary : AppColors.accent,
              BlendMode.srcIn),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.accent),
        ),
      ],
    );
  }
}
