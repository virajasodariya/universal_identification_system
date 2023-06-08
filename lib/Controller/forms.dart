import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:universal_identification_system/Controller/variable.dart';

class FormControllers extends GetxController {
  static Future<void> nextPage() {
    return Controller.controller.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }

  static Future<void> previousPage() {
    return Controller.controller.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }

  IconButton calendarIconButton(
    BuildContext context,
    TextEditingController controller,
  ) {
    DateFormat format = DateFormat('dd/MM/yyyy');
    return IconButton(
      onPressed: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          currentDate: DateTime.now(),
        ).then((value) {
          controller.text = format.format(value!).toString();
          update();
        });
        update();
      },
      icon: const Icon(Icons.calendar_month),
    );
  }
}
