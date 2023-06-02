import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/HomeScreen/form_page_two.dart';
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
          controller: TextEditingControllerVariable.nameOfTheDeceasedController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Date of Death",
          controller: TextEditingControllerVariable.dateOfDeathController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Place of Death",
          controller: TextEditingControllerVariable.placeOFDeathController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Number on the UIS Bracelet",
          controller:
              TextEditingControllerVariable.numberOnTheUISBraceletController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Date/Time Attached",
          controller: TextEditingControllerVariable.dateTimeAttachedController,
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
          controller: TextEditingControllerVariable.printedController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          hintText: "Signature",
          controller: TextEditingControllerVariable.signatureController,
          validator: (value) {
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        Padding(
          padding: EdgeInsets.only(left: 65.w, top: 8.h),
          child: CommonElevatedSmallButton(
            onPressed: () {},
            text: "Next",
          ),
        ),
      ],
    );
  }
}
