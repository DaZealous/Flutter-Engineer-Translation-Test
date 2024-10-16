
import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_image_view.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.index,
    this.height,
    this.radius,
    required this.imageUrl,
  });

  final int index;
  final double? height;
  final double? radius;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final child = Stack(
      children: [
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          top: 0.0,
          child: CustomImageView(
            imagePath: imageUrl,
            height: height,
            radius: BorderRadius.circular(radius ?? 20),
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          right: 10.0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 200000),
              curve: Curves.bounceOut,
              tween: Tween<double>(
                begin: 0,
                end: 100,
              ),
              builder: (context, value, _) => ClipRRect(
                borderRadius:
                const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 40.0,
                  backgroundColor: Colors.transparent,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
    return child;
  }
}
