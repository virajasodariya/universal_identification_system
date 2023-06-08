import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';

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
          PickColor.k00529B,
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(388.w, 56.h),
        ),
      ),
      child: Text(
        widget.text,
        style: FontTextStyle.kWhite20W400,
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
        minimumSize: MaterialStateProperty.all(Size(121.w, 56.h)),
        side: MaterialStateProperty.all(
          const BorderSide(color: PickColor.k00529B),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        "Pervious",
        style: FontTextStyle.k00529B20W400,
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
        backgroundColor: MaterialStateProperty.all(PickColor.k00529B),
        minimumSize: MaterialStateProperty.all(Size(121.sp, 56.sp)),
      ),
      child: Text(
        widget.text,
        style: FontTextStyle.kWhite20W400,
      ),
    );
  }
}
