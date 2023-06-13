import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/forms.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';

/// form number 2
class FormPageTwo extends StatefulWidget {
  const FormPageTwo({Key? key}) : super(key: key);

  @override
  State<FormPageTwo> createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
  final _formKey = GlobalKey<FormState>();

  FormControllers formControllers = Get.put(FormControllers());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormControllers>(
      builder: (controller) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Name of Funeral/Other Representative Taking\n"
                "Custody of the Deceased",
                style: FontTextStyle.k00000016W400,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Printed",
                controller: Controller.funeralPrintedForm2,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: Controller.funeralSignatureForm2,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Date/Time",
                controller: Controller.funeralDateTimeForm2,
                suffixIcon: controller.calendarIconButton(
                  context,
                  Controller.funeralDateTimeForm2,
                ),
              ),
              SizedBox(height: 35.h),
              Text(
                "Name of Crematory/Cemetery Representative\n"
                "Taking Custody of the Deceased",
                style: FontTextStyle.k00000016W400,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Printed",
                controller: Controller.crematoryPrintedForm2,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: Controller.crematorySignatureForm2,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Date/Time",
                controller: Controller.crematoryDateTimeForm2,
                suffixIcon: controller.calendarIconButton(
                  context,
                  Controller.crematoryDateTimeForm2,
                ),
              ),
              SizedBox(height: 104.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonElevatedPerviousButton(
                    onPressed: () {
                      FormControllers.previousPage();
                    },
                  ),
                  CommonElevatedSmallButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FormControllers.nextPage();
                      }
                    },
                    text: "Next",
                  ),
                ],
              ),
              SizedBox(height: 34.h),
            ],
          ),
        );
      },
    );
  }
}
