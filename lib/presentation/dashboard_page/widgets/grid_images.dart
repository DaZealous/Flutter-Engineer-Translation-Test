import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/animation/animation_service.dart';
import 'package:flutter_engineer_translation_test/core/utils/assets_data.dart';
import 'package:flutter_engineer_translation_test/presentation/dashboard_page/widgets/tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';

class GridImages extends HookWidget {
  GridImages({super.key,});

  final animationService = GetIt.I<AnimationService>();

  @override
  Widget build(BuildContext context) {
    final slideUpController =
    useAnimationController(duration: const Duration(milliseconds: 1500));

    final slideUpAnimation = animationService.createSlideAnimation(slideUpController, 0.0, 1.0);

    useEffect(() {
      slideUpController.forward();
      return null;
    }, []);

    return SlideTransition(
      position: slideUpAnimation,
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.8,
        maxChildSize: 1.0,
        expand: false,
        builder:
            (BuildContext context, ScrollController scrollController) {
          return Container(
            // height: MediaQuery.of(context).size.height/2.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                controller: scrollController,
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2.2,
                      child: Tile(
                        index: 0,
                        imageUrl: AssetsData.imageTile1.absolutePath,
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3.6,
                      child: Tile(
                        radius: 10,
                        sliderPadding: 5,
                        index: 1,
                        imageUrl: AssetsData.imageTile2.absolutePath,
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.8,
                      child: Tile(
                        sliderPadding: 5,
                        radius: 10,
                        index: 2,
                        imageUrl: AssetsData.imageTile3.absolutePath,
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.8,
                      child: Tile(
                        sliderPadding: 5,
                        radius: 10,
                        index: 3,
                        imageUrl: AssetsData.imageTile4.absolutePath,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
