import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_field.dart';

/// form number 2
class FormPageTwo extends StatefulWidget {
  const FormPageTwo({Key? key}) : super(key: key);

  @override
  State<FormPageTwo> createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 6.w),
          child: Text(
            textAlign: TextAlign.left,
            "Name of Funeral/Other Representative Taking\n"
            "Custody of the Deceased",
            style: FontTextStyle.kBlack12PolyW500,
          ),
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Printed",
          controller: Controller.funeralPrintedForm2,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Signature",
          controller: Controller.funeralSignatureForm2,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.number,
          hintText: "Date/Time",
          controller: Controller.funeralDateTimeForm2,
          validator: (value) {
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: 7.w, top: 4.h),
          child: Text(
            textAlign: TextAlign.left,
            "Name of Crematory/Cemetery Representative\n"
            "Taking Custody of the Deceased",
            style: FontTextStyle.kBlack12PolyW500,
          ),
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Printed",
          controller: Controller.crematoryPrintedForm2,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Signature",
          controller: Controller.crematorySignatureForm2,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.number,
          hintText: "Date/Time",
          controller: Controller.crematoryDateTimeForm2,
          validator: (value) {
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonElevatedPerviousButton(
                onPressed: () {},
              ),
              CommonElevatedSmallButton(
                onPressed: () {},
                text: "Next",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
