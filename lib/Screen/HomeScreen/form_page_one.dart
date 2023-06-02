import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_field.dart';

/// form number 1
class FormPageOne extends StatefulWidget {
  const FormPageOne({Key? key}) : super(key: key);

  @override
  State<FormPageOne> createState() => _FormPageOneState();
}

class _FormPageOneState extends State<FormPageOne> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Name of the Deceased",
          controller: Controller.nameOfTheDeceasedForm1,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.number,
          hintText: "Date of Death",
          controller: Controller.dateOfDeathForm1,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Place of Death",
          controller: Controller.placeOfDeathForm1,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Number on the UIS Bracelet",
          controller: Controller.numberOnTheUISBraceletForm1,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Date/Time Attached",
          controller: Controller.dateTimeAttachedForm1,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 4.h),
        Text(
          textAlign: TextAlign.left,
          "Name of Person Securing the UIS on the Deceased"
          "\n(Place the Bracelet on the ankle of the deceased)",
          style: FontTextStyle.kBlack12PolyW500,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Printed",
          controller: Controller.printedForm1,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Signature",
          controller: Controller.signatureForm1,
          validator: (value) {
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 65.w, top: 8.h),
          child: CommonElevatedSmallButton(
            onPressed: () {
              Controller.controller.nextPage(
                duration: const Duration(seconds: 3),
                curve: Curves.linear,
              );
            },
            text: "Next",
          ),
        ),
      ],
    );
  }
}
