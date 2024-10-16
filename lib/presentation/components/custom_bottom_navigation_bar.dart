import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/presentation/components/custom_button.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final Function(int index) onItemSelected;

  final List<IconData> items = [
    Icons.search,
    Icons.home,
    Icons.chat,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 40, left: 45, right: 45),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          height: 70,
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
                  icon: items[index],
                  iconColor: Colors.white,
                  padding: index == selectedIndex ? 20.00 : 15.00,
                  backgroundColor:
                      index == selectedIndex ? AppColors.primary : Colors.black,
                  onTap: () {
                    onItemSelected(index);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
