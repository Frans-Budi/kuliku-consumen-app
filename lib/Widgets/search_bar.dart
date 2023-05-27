import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SearchBar extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTapSearchBar;

  const SearchBar({
    super.key,
    this.hintText = "",
    this.onTapSearchBar,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.textGray,
      autocorrect: false,
      onTap: onTapSearchBar,
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        hintText: hintText,
        prefixIcon: const Icon(Icons.search_rounded),
        filled: true,
        fillColor: AppColors.backgroundColor,
      ),
    );
  }
}
