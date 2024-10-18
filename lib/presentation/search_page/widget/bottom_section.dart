import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/animation/animation_service.dart';
import 'package:flutter_engineer_translation_test/core/utils/assets_data.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_button.dart';
import 'package:flutter_engineer_translation_test/presentation/search_page/widget/custom_popup_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

class BottomSection extends HookWidget {
  BottomSection({super.key});

  final animationService = GetIt.I<AnimationService>();
  final List popupItems = [
    {'image': AssetsData.verifyIcon, 'title': 'Cosy areas'},
    {'image': AssetsData.walletIcon, 'title': 'Price'},
    {'image': AssetsData.infrastructureIcon, 'title': 'Infrastructure'},
    {'image': AssetsData.layersIcon, 'title': 'Without any layer'},
  ];

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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            ScaleTransition(
              scale: zoomAnimation,
              child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  _showPopupMenu(context, details.globalPosition);
                },
                child: CustomButton(
                  image: AssetsData.layersIcon.svgPicture(
                    height: 25,
                    width: 25,
                  ),
                  iconColor: Colors.white,
                  padding: 12.00,
                  backgroundColor: Colors.grey.withOpacity(
                    0.6,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ScaleTransition(
              scale: zoomAnimation,
              child: CustomButton(
                image: AssetsData.locationUp.svgPicture(
                  height: 25,
                  width: 25,
                ),
                iconColor: Colors.white,
                padding: 12.00,
                backgroundColor: Colors.grey.withOpacity(
                  0.6,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        ScaleTransition(
          scale: zoomAnimation,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Colors.grey.withOpacity(
                  0.6,
                )),
            child: Row(
              children: [
                AssetsData.filterList.svgPicture(
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'List of varaints',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context, Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, left, top),
      items: List.generate(popupItems.length, (index) {
        return PopupMenuItem(
          value: index,
          child: CustomPopup(
            index: index,
            title: popupItems[index]['title'],
            imagePath: popupItems[index]['image'],
          ),
        );
        // return PopupMenuItem(child: Text(''));
      }),
      elevation: 8.0,
    ).then((value) {
      // NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null , value is the value given in PopupMenuItem
      if (value != null) print(value);
    });
  }
}
