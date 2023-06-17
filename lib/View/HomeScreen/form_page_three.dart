import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/forms.dart';
import 'package:universal_identification_system/View/HomeScreen/bottom_bar.dart';
import 'package:universal_identification_system/View/Widget/e_sign.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';
import 'package:universal_identification_system/ViewModel/single_form_view_model.dart';

///form number 3
class FormPageThree extends StatefulWidget {
  const FormPageThree({Key? key}) : super(key: key);

  @override
  State<FormPageThree> createState() => _FormPageThreeState();
}

class _FormPageThreeState extends State<FormPageThree> {
  final formKey = GlobalKey<FormState>();

  FormControllers formControllers = Get.put(FormControllers());
  SingleFormViewModel singleFormViewModel = Get.find<SingleFormViewModel>();

  File? imageFile;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleFormViewModel>(
      builder: (controller) {
        return Form(
          key: formKey,
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
                controller: singleFormViewModel.printedReceiveForm3,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Relationship",
                controller: singleFormViewModel
                    .nameOfPersonEntitledToReceiveCrematedRemainsRelationship,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: singleFormViewModel
                    .nameOfPersonEntitledToReceiveCrematedRemainsEsign,
                suffixIcon: ESign.elevatedButtonSmall(
                  () {
                    ESign.generalDialog();
                  },
                  "Esign",
                ),
              ),
              SizedBox(height: 14.h),
              GetBuilder<FormControllers>(
                builder: (formController1) {
                  return CommonTextFormField(
                    keyboardType: TextInputType.name,
                    hintText: "Date/Time",
                    controller: singleFormViewModel
                        .nameOfPersonEntitledToReceiveCrematedRemainsDt,
                    suffixIcon: formControllers.calendarIconButton(
                      context,
                      singleFormViewModel
                          .nameOfPersonEntitledToReceiveCrematedRemainsDt,
                    ),
                  );
                },
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
                controller: singleFormViewModel.printedReleasingForm3,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                suffixIcon: ESign.elevatedButtonSmall(
                  () {
                    ESign.generalDialog();
                  },
                  "Esign",
                ),
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: singleFormViewModel
                    .nameOfPersonReleasingCrematedRemainsEsign,
              ),
              SizedBox(height: 14.h),
              GetBuilder<FormControllers>(
                builder: (formController2) {
                  return CommonTextFormField(
                    keyboardType: TextInputType.name,
                    hintText: "Date/Time",
                    controller: singleFormViewModel
                        .nameOfPersonReleasingCrematedRemainsDt,
                    suffixIcon: formControllers.calendarIconButton(
                      context,
                      singleFormViewModel
                          .nameOfPersonReleasingCrematedRemainsDt,
                    ),
                  );
                },
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
              ESign.elevatedButtonSmall(
                () {
                  ESign.generalDialog();
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
                      if (formKey.currentState!.validate()) {
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
}
