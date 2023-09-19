import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/test_style.dart';

class CommonDropdownButton extends StatefulWidget {
  const CommonDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.hintText,
    required this.widget,
  });
  final value;
  final ValueChanged onChanged;
  final String hintText;
  final Widget widget;

  @override
  State<CommonDropdownButton> createState() => _CommonDropdownButtonState();
}

class _CommonDropdownButtonState extends State<CommonDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffE0E0E0),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: DropdownButton(
          underline: const SizedBox(),
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: FontTextStyle.k84848414W400,
          ),
          items: [
            DropdownMenuItem(
              value: widget.value,
              child: widget.widget,
            ),
          ],
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
