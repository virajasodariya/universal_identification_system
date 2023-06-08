import 'package:flutter/material.dart';

class CommonBackButton extends StatefulWidget {
  const CommonBackButton({
    super.key,
    required this.onPressed,
  });
  final GestureTapCallback onPressed;

  @override
  State<CommonBackButton> createState() => _CommonBackButtonState();
}

class _CommonBackButtonState extends State<CommonBackButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }
}
