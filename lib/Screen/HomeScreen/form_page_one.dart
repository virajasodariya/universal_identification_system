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
          hintText: "Name of the Deceased",
          controller: VariableController.nameOfTheDeceasedController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Date of Death",
          controller: VariableController.dateOfDeathController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Place of Death",
          controller: VariableController.placeOFDeathController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Number on the UIS Bracelet",
          controller: VariableController.numberOnTheUISBraceletController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Date/Time Attached",
          controller: VariableController.dateTimeAttachedController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
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
          hintText: "Printed",
          controller: VariableController.printedController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Signature",
          controller: VariableController.signatureController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        Padding(
          padding: EdgeInsets.only(left: 65.w, top: 8.h),
          child: CommonElevatedSmallButton(
            onPressed: () {
              VariableController.controller.nextPage(
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
