import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/animation/animation_service.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_image_view.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

class Tile extends HookWidget {
  Tile({
    super.key,
    required this.index,
    this.height,
    this.sliderPadding,
    this.radius,
    required this.imageUrl,
  });

  final int index;
  final double? height;
  final double? sliderPadding;
  final double? radius;
  final String? imageUrl;

  final animationService = GetIt.I<AnimationService>();

  @override
  Widget build(BuildContext context) {
    final slideController =
        useAnimationController(duration: const Duration(milliseconds: 2000));
    final fadeController =
    useAnimationController(duration: const Duration(milliseconds: 1000));

    final fadeAnimation = animationService.createFadeAnimation(fadeController);
    final slideAnimation =
        animationService.createSlideAnimation(slideController, -1.0, 0.0);

    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 1000),
      ).whenComplete(() => slideController.forward().then((_) => fadeController.forward()));
      return null;
    }, []);

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
          child: SlideTransition(
            position: slideAnimation,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: AppColors.accent.withOpacity(
                    0.7,
                  )),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: Text(
                          'Gladkova St., 5',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(sliderPadding ?? 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              spreadRadius: 3.0,
                              blurRadius: 12.0,
                              blurStyle: BlurStyle.normal,
                              offset: const Offset(-4.0, -0.2))
                        ]),
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    return child;
  }
}
