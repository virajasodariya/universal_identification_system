import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/HomeScreen/bottom_bar.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_field.dart';
import 'package:hand_signature/signature.dart';

///form number 3
class FormPageThree extends StatefulWidget {
  const FormPageThree({Key? key}) : super(key: key);

  @override
  State<FormPageThree> createState() => _FormPageThreeState();
}

class _FormPageThreeState extends State<FormPageThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            "Name of person entitled to receive the cremated\n"
            "remains",
            style: FontTextStyle.kBlack12PolyW500,
          ),
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Printed",
          controller: Controller.printedReceiveForm3,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Relationship",
          controller: Controller.relationshipReceiveForm3,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Signature",
          controller: Controller.signatureReceiveForm3,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Date/Time",
          controller: Controller.dateTimeReceiveForm3,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 6.h),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Text(
            "Name of person releasing cremated remains",
            style: FontTextStyle.kBlack12PolyW500,
          ),
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Printed",
          controller: Controller.printedReleasingForm3,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Signature",
          controller: Controller.signatureReleasingForm3,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "Date/Time",
          controller: Controller.dateTimeReleasingForm3,
          validator: (value) {
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: 65.w, top: 3.h),
          child: Text(
            textAlign: TextAlign.left,
            "Upload Photo",
            style: FontTextStyle.kBlack12PolyW500,
          ),
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          hintText: "",
          controller: Controller.uploadPhotoForm3,
          validator: (value) {
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: 70.w, top: 2.h),
          child: buildElevatedButtonSmall(
            () {
              buildGeneralDialog();
            },
            "Esign",
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonElevatedPerviousButton(
                onPressed: () {},
              ),
              CommonElevatedSmallButton(
                onPressed: () {
                  Get.to(() => const BottomBarScreen());
                },
                text: "Submit",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> buildGeneralDialog() {
    return Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        final control = HandSignatureControl(
          threshold: 3.0,
          smoothRatio: 0.65,
          velocityRange: 2.0,
        );
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: Container(
                  height: 20.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffFCFCFC),
                    borderRadius: BorderRadius.circular(2.h),
                    border: Border.all(
                      color: const Color(0xffF0F0F0),
                      width: 0.2.h,
                    ),
                  ),
                  child: HandSignature(
                    control: control,
                    color: ColorHelper.kMediumElectricBlue,
                    // strokeWidth: 1.0,
                    // maxStrokeWidth: 10.0,
                    width: 1.0,
                    maxWidth: 10.0,
                    type: SignatureDrawType.shape,
                  ),
                ),
              ),
              CommonElevatedSmallButton(
                onPressed: () {
                  Get.back();
                },
                text: "Save",
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                child: buildElevatedButtonSmall(
                  () {
                    control.clear();
                  },
                  "Redo",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ElevatedButton buildElevatedButtonSmall(VoidCallback onPressed, String text) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(Size(60.sp, 28.sp)),
        shadowColor: MaterialStateProperty.all(Colors.grey),
      ),
      child: Text(
        text,
        style: FontTextStyle.kMediumElectricBlue12Poly,
      ),
    );
  }
}
