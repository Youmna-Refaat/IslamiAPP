import 'package:flutter/material.dart';

import '../../../core/theme/color_class.dart';

class SearchCityTextField extends StatelessWidget {
  const SearchCityTextField({
    super.key,
    required TextEditingController cityController,
  }) : _cityController = cityController;

  final TextEditingController _cityController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _cityController,
      style: TextStyle(
        fontFamily: 'Janna',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.titleTextColor,
      ),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
        hintText: "Enter City",
        hintStyle: TextStyle(
          fontFamily: 'Janna',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.titleTextColor,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.search,
            size: 28,
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
