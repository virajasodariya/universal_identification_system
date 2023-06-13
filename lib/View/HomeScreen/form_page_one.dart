import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/forms.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';

/// form number 1
class FormPageOne extends StatefulWidget {
  const FormPageOne({Key? key}) : super(key: key);

  @override
  State<FormPageOne> createState() => _FormPageOneState();
}

class _FormPageOneState extends State<FormPageOne> {
  final _formKey = GlobalKey<FormState>();

  FormControllers formControllers = Get.put(FormControllers());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormControllers>(
      builder: (controller) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Name of the Deceased",
                controller: Controller.nameOfTheDeceasedForm1,
              ),
              SizedBox(height: 14.h),
              GetBuilder<FormControllers>(
                builder: (controller) {
                  return CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "Date of Death",
                    controller: Controller.dateOfDeathForm1,
                    suffixIcon: controller.calendarIconButton(
                      context,
                      Controller.dateOfDeathForm1,
                    ),
                  );
                },
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Place of Death",
                controller: Controller.placeOfDeathForm1,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Number on the UIS Bracelet",
                controller: Controller.numberOnTheUISBraceletForm1,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Date/Time Attached",
                controller: Controller.dateTimeAttachedForm1,
              ),
              SizedBox(height: 35.h),
              Text(
                "Name of Person Securing the UIS on the Deceased"
                "\n(Place the Bracelet on the ankle of the deceased)",
                style: FontTextStyle.k00000016W400,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Printed",
                controller: Controller.printedForm1,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: Controller.signatureForm1,
              ),
              SizedBox(height: 84.h),
              Align(
                alignment: Alignment.centerRight,
                child: CommonElevatedSmallButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FormControllers.nextPage();
                    }
                  },
                  text: "Next",
                ),
              ),
              SizedBox(height: 34.h),
            ],
          ),
        );
      },
    );
  }
}
