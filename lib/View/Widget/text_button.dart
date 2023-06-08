import 'package:flutter/material.dart';
import 'package:universal_identification_system/Constants/test_style.dart';

class CommonTextButton extends StatefulWidget {
  const CommonTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  State<CommonTextButton> createState() => _CommonTextButtonState();
}

class _CommonTextButtonState extends State<CommonTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: FontTextStyle.k00529B14W400,
      ),
    );
  }
}
