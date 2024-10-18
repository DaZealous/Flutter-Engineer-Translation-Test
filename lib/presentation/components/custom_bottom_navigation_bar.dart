import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/animation/animation_service.dart';
import 'package:flutter_engineer_translation_test/core/utils/assets_data.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_button.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

class CustomBottomNavigationBar extends HookWidget {
  CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final Function(int index) onItemSelected;

  final List<Widget> items = [
    AssetsData.searchIconFilled.svgPicture(),
    AssetsData.chatIcon.svgPicture(),
    AssetsData.homeIcon.svgPicture(),
    AssetsData.favoriteIcon.svgPicture(),
    AssetsData.userIcon.svgPicture(),
  ];

  final animationService = GetIt.I<AnimationService>();

  @override
  Widget build(BuildContext context) {
    final slideUpController =
        useAnimationController(duration: const Duration(milliseconds: 1500));

    final slideUpAnimation =
        animationService.createSlideAnimation(slideUpController, 0.0, 1.0);

    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 3000),
      ).whenComplete(() => slideUpController.forward());
      return null;
    }, []);

    return SlideTransition(
      position: slideUpAnimation,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0.0, bottom: 45, left: 50, right: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0.0),
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                items.length,
                (int index) {
                  return CustomButton(
                    image: items[index],
                    iconColor: Colors.white,
                    padding: index == selectedIndex ? 10.00 : 12.00,
                    backgroundColor: index == selectedIndex
                        ? AppColors.primary
                        : Colors.black,
                    onTap: () {
                      onItemSelected(index);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
