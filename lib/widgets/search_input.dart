import 'package:flutter/material.dart';
import 'package:gif_search_test_task/constants/app_color.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchInput({
    super.key,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search for a GIF...',
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.primary,
          size: 24,
        ),

        filled: true,
        fillColor: AppColors.searchBackground,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),

        //An unobtrusive boundary in the normal state.
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none
        ),

        // Purple border when clicked
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5
          )
        ),
        // // The clear button appears when there is text.
        suffixIcon: controller.text.isNotEmpty 
          ? IconButton(onPressed: () {
            controller.clear();
            onChanged('');
          }, 
          icon: const Icon(Icons.close_rounded), 
        )
        : null, 
      ),
    );
  }


}