import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/forms.dart';
import 'package:universal_identification_system/View/Widget/e_sign.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';
import 'package:universal_identification_system/ViewModel/single_form_view_model.dart';

/// form number 2
class FormPageTwo extends StatefulWidget {
  const FormPageTwo({Key? key}) : super(key: key);

  @override
  State<FormPageTwo> createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
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
                controller: singleFormViewModel.funeralPrintedForm2,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: singleFormViewModel
                    .nameFuneralDirectorOtherRepresentativeTakingCustodyEsign,
                suffixIcon: ESign.elevatedButtonSmall(
                  () {
                    ESign.generalDialog();
                  },
                  "Esign",
                ),
              ),
              SizedBox(height: 14.h),
              GetBuilder<FormControllers>(
                builder: (formController) {
                  return CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "Date/Time",
                    controller: singleFormViewModel
                        .nameFuneralDirectorOtherRepresentativeTakingCustodyDt,
                    suffixIcon: formControllers.calendarIconButton(
                      context,
                      singleFormViewModel
                          .nameFuneralDirectorOtherRepresentativeTakingCustodyDt,
                    ),
                  );
                },
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
                controller: singleFormViewModel.crematoryPrintedForm2,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: singleFormViewModel
                    .nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign,
                suffixIcon: ESign.elevatedButtonSmall(
                  () {
                    ESign.generalDialog();
                  },
                  "Esign",
                ),
              ),
              SizedBox(height: 14.h),
              GetBuilder<FormControllers>(
                builder: (formController) {
                  return CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "Date/Time",
                    controller: singleFormViewModel
                        .nameCrematoryCemeteryRepresentativeCustodyDeceasedDt,
                    suffixIcon: formController.calendarIconButton(
                      context,
                      singleFormViewModel
                          .nameCrematoryCemeteryRepresentativeCustodyDeceasedDt,
                    ),
                  );
                },
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
