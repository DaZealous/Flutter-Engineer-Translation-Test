import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/animation/animation_service.dart';
import 'package:flutter_engineer_translation_test/core/utils/assets_data.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_button.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_search_box.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

class TopSection extends HookWidget {
  TopSection({super.key});

  final animationService = GetIt.I<AnimationService>();

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 1200));

    final zoomAnimation =
        animationService.createZoomAnimation(animationController);

    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 200),
      ).whenComplete(() => animationController.forward());
      return null;
    }, []);

    return Row(
      children: [
        Expanded(
          child: ScaleTransition(
            scale: zoomAnimation,
            child: const CustomSearchBox(),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ScaleTransition(
          scale: zoomAnimation,
          child: CustomButton(
            image: AssetsData.filterIcon.svgPicture(
              height: 25,
              width: 25
            ),
            iconColor: Colors.black,
            padding: 12.00,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
