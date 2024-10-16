import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/animation/animation_service.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_image_view.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import 'custom_offers.dart';

class ProfileSection extends HookWidget {
  ProfileSection(
      {super.key, required this.location, required this.profileUrl});

  final String location;
  final String profileUrl;

  final animationService = GetIt.I<AnimationService>();

  @override
  Widget build(BuildContext context) {

    //controllers
    final animationController = useAnimationController(duration: const Duration(milliseconds: 1200));
    final animationController2 = useAnimationController(duration: const Duration(milliseconds: 1500));
    final slideController = useAnimationController(duration: const Duration(milliseconds: 1200));
    final fadeController =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    final textFadeController =
        useAnimationController(duration: const Duration(milliseconds: 500));
    final textSlideController =
        useAnimationController(duration: const Duration(milliseconds: 1200));

    //animations
    final fadeAnimation = animationService.createFadeAnimation(fadeController);
    final textFadeAnimation =
        animationService.createFadeAnimation(textFadeController);
    final zoomAnimation = animationService.createZoomAnimation(animationController);
    final zoomAnimation2 = animationService.createZoomAnimation(animationController2);
    final slideAnimation = animationService.createSlideAnimation(slideController, -1.0, 0.0);
    final textSlideAnimation = animationService.createSlideAnimation(textSlideController, 0.0, 1.0);

    useEffect(() {
      animationController.forward().then((_) => animationController2.forward());
      textSlideController.forward().then((_) => textFadeController.forward());
      slideController.forward().then(
            (_) => fadeController.forward(),
          );
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SlideTransition(
              position: slideAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: AppColors.accent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        location,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.accent,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            ScaleTransition(
              scale: zoomAnimation,
              child: ClipOval(
                child: CustomImageView(
                  imagePath: profileUrl,
                  height: 50,
                  width: 50,
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: textFadeAnimation,
              child: Text(
                'Hi, Marina',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.accent,
                    ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SlideTransition(
              position: textSlideAnimation,
              child: Text(
                'let\'s select your\nperfect place',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ScaleTransition(
                scale: zoomAnimation2,
                child: const CustomOffers(
                  title: 'BUY',
                  middleTitle: '1034',
                  subTitle: 'offers',
                  textColor: Colors.white,
                  backgroundColor: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Spacer(),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: ScaleTransition(
                scale: zoomAnimation2,
                child: const CustomOffers(
                  title: 'RENT',
                  middleTitle: '2212',
                  subTitle: 'offers',
                  textColor: AppColors.accent,
                  backgroundColor: Colors.white,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
