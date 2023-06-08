import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    Key? key,
    required this.keyboardType,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.suffixIcon,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final dynamic suffixIcon;

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
      cursorColor: PickColor.kBCA07D,
      decoration: InputDecoration(
        // constraints: BoxConstraints(maxWidth: 388.w, minHeight: 56.h),
        hintText: widget.hintText,
        hintStyle: FontTextStyle.k84848414W400,
        filled: true,
        fillColor: const Color(0xffF7F7F7),
        suffixIcon: widget.suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Color(0xffE0E0E0))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Color(0xffE0E0E0))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }
}
