import 'package:flutter/material.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/show_toast.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CommonToast.showToast("hey, This is viraj!");
          },
          child: const Text("Tap Here"),
        ),
      ),
    );
  }
}
