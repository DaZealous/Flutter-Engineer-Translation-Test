import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/utils/assets_data.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AssetsData.searchIcon.svgPicture(
            height: 10,
            width: 10
          ),
        ),
        hintText: 'Saint Petersburg',
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
