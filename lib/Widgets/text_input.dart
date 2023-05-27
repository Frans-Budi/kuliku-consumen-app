import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../utils/colors.dart';

class TextInput extends StatefulWidget {
  final String? hintText;
  final Widget prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? inputFormatter;
  final bool? autoFocus;
  final String? prefixText;
  final bool? readOnly;
  final Function? onChanged;
  final VoidCallback? onTapSearchBar;

  const TextInput({
    super.key,
    this.hintText = "",
    required this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
    this.autoFocus = false,
    this.prefixText = "",
    this.readOnly = false,
    this.onChanged,
    this.onTapSearchBar,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _backgroundColor = AppColors.backgroundColor;

  List<TextInputFormatter>? _inputFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.deny("\n")
  ];

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

    if (widget.inputFormatter == "number") {
      _inputFormatter = <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ];
    } else if (widget.inputFormatter == "email") {
      _inputFormatter = <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 @.]"))
      ];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _textFieldFocus,
      cursorColor: AppColors.textGray,
      autocorrect: false,
      autofocus: widget.autoFocus!,
      controller: widget.controller, // <-- Controller
      readOnly: widget.readOnly!, // <-- ReadOnly
      onChanged: (value) => widget.onChanged, // <-- OnChanged
      keyboardType: widget.keyboardType,
      inputFormatters: _inputFormatter,
      onTap: widget.onTapSearchBar,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        prefixText: widget.prefixText,
        prefixStyle: TextStyle(
          color: AppColors.textBlack,
          fontSize: Dimensions.font16,
        ),
        filled: true,
        fillColor: _backgroundColor,
      ),
    );
  }
}
