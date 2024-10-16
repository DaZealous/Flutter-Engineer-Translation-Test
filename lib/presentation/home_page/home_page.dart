import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/providers/providers.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_engineer_translation_test/presentation/dashboard_page/dashboard_page.dart';
import 'package:flutter_engineer_translation_test/presentation/search_page/search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  final List<Widget> pages = const [
    SearchPage(),
    Center(),
    DashboardPage(),
    Center(),
    Center(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentIndex,
        onItemSelected: (int index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
      ),
      body: pages[currentIndex],
    );
  }
}
