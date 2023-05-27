import 'package:flutter/material.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../utils/colors.dart';

class TextInputPassword extends StatefulWidget {
  final String? hintText;
  final Widget prefixIcon;
  final TextEditingController? controller;
  final VoidCallback? onTapSearchBar;

  const TextInputPassword({
    super.key,
    this.hintText = "",
    required this.prefixIcon,
    this.controller,
    this.onTapSearchBar,
  });

  @override
  State<TextInputPassword> createState() => _TextInputPasswordState();
}

class _TextInputPasswordState extends State<TextInputPassword> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _backgroundColor = AppColors.backgroundColor;

  bool _isHidden = true;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _backgroundColor = AppColors.softPurple;
        });
      } else {
        setState(() {
          _backgroundColor = AppColors.backgroundColor;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _backgroundColor,
      borderRadius: BorderRadius.circular(100),
      child: TextField(
        focusNode: _textFieldFocus,
        cursorColor: AppColors.textGray,
        autocorrect: false,
        controller: widget.controller,
        obscureText: _isHidden,
        onTap: widget.onTapSearchBar,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 2),
          ),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: Dimensions.height10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
              icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
              splashRadius: Dimensions.radius25,
            ),
          ),
        ),
      ),
    );
  }
}
