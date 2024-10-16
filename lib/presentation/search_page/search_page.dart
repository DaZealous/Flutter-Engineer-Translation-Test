import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/presentation/components/dismiss_keyboard.dart';
import 'package:flutter_engineer_translation_test/presentation/search_page/widget/bottom_section.dart';
import 'package:flutter_engineer_translation_test/presentation/search_page/widget/map_widget.dart';
import 'package:flutter_engineer_translation_test/presentation/search_page/widget/top_section.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        body: Stack(
          children: [
            MapWidget(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                child: Column(
                  children: [
                    TopSection(),
                    const Spacer(),
                    BottomSection()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
