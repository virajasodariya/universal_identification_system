import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';

///
class CommonElevatedButton extends StatefulWidget {
  const CommonElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  State<CommonElevatedButton> createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          ColorHelper.kMediumElectricBlue,
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(90.w, 6.5.h),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.5.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poly",
        ),
      ),
    );
  }
}

///

class CommonElevatedPerviousButton extends StatefulWidget {
  const CommonElevatedPerviousButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  State<CommonElevatedPerviousButton> createState() =>
      _CommonElevatedPerviousButtonState();
}

class _CommonElevatedPerviousButtonState
    extends State<CommonElevatedPerviousButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        minimumSize: MaterialStateProperty.all(Size(75.sp, 35.sp)),
        side: MaterialStateProperty.all(
          const BorderSide(color: ColorHelper.kMediumElectricBlue),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        "Pervious",
        style: TextStyle(
          color: ColorHelper.kMediumElectricBlue,
          fontFamily: "Poly",
          fontSize: 12.sp,
        ),
      ),
    );
  }
}

///
class CommonElevatedSmallButton extends StatefulWidget {
  const CommonElevatedSmallButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  State<CommonElevatedSmallButton> createState() =>
      _CommonElevatedSmallButtonState();
}

class _CommonElevatedSmallButtonState extends State<CommonElevatedSmallButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(ColorHelper.kMediumElectricBlue),
        minimumSize: MaterialStateProperty.all(Size(75.sp, 35.sp)),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Poly",
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
