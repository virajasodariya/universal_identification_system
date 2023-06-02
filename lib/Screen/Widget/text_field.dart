import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    Key? key,
    required this.keyboardType,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: FontTextStyle.kBattleshipGrey11PolyW500,
        constraints: BoxConstraints(maxWidth: 90.w),
        filled: true,
        fillColor: const Color(0xffF7F7F7),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.8.h),
          borderSide: BorderSide(
            color: const Color(0xffE0E0E0),
            width: 0.4.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.8.h),
          borderSide: BorderSide(
            color: const Color(0xffE0E0E0),
            width: 0.4.w,
          ),
        ),
      ),
    );
  }
}
