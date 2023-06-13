import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/forms.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:hand_signature/signature.dart';
import 'package:universal_identification_system/View/HomeScreen/bottom_bar.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';

///form number 3
class FormPageThree extends StatefulWidget {
  const FormPageThree({Key? key}) : super(key: key);

  @override
  State<FormPageThree> createState() => _FormPageThreeState();
}

class _FormPageThreeState extends State<FormPageThree> {
  final _formKey = GlobalKey<FormState>();

  FormControllers formControllers = Get.put(FormControllers());

  File? imageFile;
  ImagePicker picker = ImagePicker();

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
                "Name of person entitled to receive the cremated\n"
                "remains",
                style: FontTextStyle.k00000016W400,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Printed",
                controller: Controller.printedReceiveForm3,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Relationship",
                controller: Controller.relationshipReceiveForm3,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: Controller.signatureReceiveForm3,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Date/Time",
                controller: Controller.dateTimeReceiveForm3,
                suffixIcon: controller.calendarIconButton(
                  context,
                  Controller.dateTimeReceiveForm3,
                ),
              ),
              SizedBox(height: 57.h),
              Text(
                "Name of person releasing cremated remains",
                style: FontTextStyle.k00000016W400,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Printed",
                controller: Controller.printedReleasingForm3,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: Controller.signatureReleasingForm3,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Date/Time",
                controller: Controller.dateTimeReleasingForm3,
                suffixIcon: controller.calendarIconButton(
                  context,
                  Controller.dateTimeReleasingForm3,
                ),
              ),
              SizedBox(height: 31.h),
              Text(
                textAlign: TextAlign.left,
                "Upload Photo",
                style: FontTextStyle.k00000016W400,
              ),
              SizedBox(height: 14.h),
              Container(
                height: 56.h,
                width: 388.w,
                decoration: BoxDecoration(
                  color: const Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: const Color(0xffE0E0E0)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          XFile? file = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {
                            imageFile = File(file!.path);
                          });
                        },
                        child: Container(
                          height: 31.h,
                          width: 88.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffDEDEDE),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              "Choose file",
                              style: TextStyle(
                                color: PickColor.k848484,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      imageFile == null
                          ? Icon(
                              Icons.verified_outlined,
                              color: Colors.red,
                              size: 25.sp,
                            )
                          : Icon(
                              Icons.verified,
                              color: Colors.green,
                              size: 25.sp,
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 31.h),
              buildElevatedButtonSmall(
                () {
                  buildGeneralDialog();
                },
                "Esign",
              ),
              SizedBox(height: 46.h),
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
                        Get.offAll(() => const BottomBarScreen(),
                            transition: Transition.zoom);
                      }
                    },
                    text: "Submit",
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

  Future<dynamic> buildGeneralDialog() {
    return Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        final control = HandSignatureControl(
          threshold: 3.0,
          smoothRatio: 0.65,
          velocityRange: 2.0,
        );
        return Dialog(
          child: Container(
            height: 356.h,
            width: 311.w,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 26.h),
                Container(
                  height: 177.h,
                  width: 271.w,
                  decoration: BoxDecoration(
                    color: PickColor.kBCA07D,
                    borderRadius: BorderRadius.circular(2.h),
                    border: Border.all(
                      color: const Color(0xffF0F0F0),
                      width: 0.2.h,
                    ),
                  ),
                  child: HandSignature(
                    control: control,
                    color: PickColor.k00529B,
                    // strokeWidth: 1.0,
                    // maxStrokeWidth: 10.0,
                    width: 1.0,
                    maxWidth: 10.0,
                    type: SignatureDrawType.shape,
                  ),
                ),
                SizedBox(height: 27.h),
                CommonElevatedSmallButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: "Save",
                ),
                SizedBox(height: 10.h),
                buildElevatedButtonSmall(
                  () {
                    control.clear();
                  },
                  "Redo",
                ),
              ],
            ),
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
        minimumSize: MaterialStateProperty.all(Size(79.sp, 35.sp)),
        shadowColor: MaterialStateProperty.all(Colors.grey),
      ),
      child: Text(
        text,
        style: FontTextStyle.k00529B14W400,
      ),
    );
  }
}
