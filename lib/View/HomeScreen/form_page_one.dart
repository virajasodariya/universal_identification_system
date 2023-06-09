import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/forms.dart';
import 'package:universal_identification_system/View/Widget/e_sign.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';
import 'package:universal_identification_system/ViewModel/single_form_view_model.dart';

/// form number 1
class FormPageOne extends StatefulWidget {
  const FormPageOne({Key? key}) : super(key: key);

  @override
  State<FormPageOne> createState() => _FormPageOneState();
}

class _FormPageOneState extends State<FormPageOne> {
  final _formKey = GlobalKey<FormState>();

  FormControllers formControllers = Get.put(FormControllers());
  SingleFormViewModel singleFormViewModel = Get.find<SingleFormViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleFormViewModel>(
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
                controller: singleFormViewModel.deceasedName,
              ),
              SizedBox(height: 14.h),
              GetBuilder<FormControllers>(
                builder: (formController) {
                  return CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "Date of Death",
                    controller: singleFormViewModel.dateOfDeath,
                    suffixIcon: formControllers.calendarIconButton(
                      context,
                      singleFormViewModel.dateOfDeath,
                    ),
                  );
                },
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Place of Death",
                controller: singleFormViewModel.placeOfDeath,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Number on the UIS Bracelet",
                controller: singleFormViewModel.numberOnUisBand,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Date/Time Attached",
                controller: singleFormViewModel.dateTimeAttached,
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
                controller: singleFormViewModel.printedForm1,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: singleFormViewModel.signatureForm1,
                suffixIcon: ESign.elevatedButtonSmall(
                  () {
                    ESign.generalDialog();
                  },
                  "Esign",
                ),
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
