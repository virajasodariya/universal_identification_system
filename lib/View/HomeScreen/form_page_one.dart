import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Api/status.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/forms.dart';
import 'package:universal_identification_system/Model/Response/countries_response_model.dart';
import 'package:universal_identification_system/View/Widget/drop_down_button.dart';
import 'package:universal_identification_system/View/Widget/e_sign.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';
import 'package:universal_identification_system/ViewModel/countries_view_model.dart';
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
  CountriesViewModel countriesViewModel = Get.put(CountriesViewModel());

  Future getdata() async {
    countriesViewModel.countriesViewModel();
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  dynamic dropDownValue;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleFormViewModel>(
      builder: (singleFormController) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Name of the Deceased",
                controller: singleFormController.deceasedName,
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
              GetBuilder<CountriesViewModel>(
                builder: (countryController) {
                  if (countryController.apiResponse.status == Status.COMPLETE) {
                    CountriesResponseModel countryData =
                        countryController.apiResponse.data;
                    return Container(
                      height: 56.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: PickColor.kBCA07D,
                          border: Border.all(color: PickColor.kBCA07D)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: DropdownButton(
                          dropdownColor: Colors.grey.shade100,
                          style: TextStyle(
                              color: const Color(0xff848484),
                              fontFamily: 'Poly',
                              fontSize: 14.sp),
                          hint: Text("Select State",
                              style: TextStyle(
                                  fontFamily: 'Poly',
                                  color: const Color(0xff848484),
                                  fontSize: 14.sp)),
                          isExpanded: true,
                          value: dropDownValue,
                          underline: const SizedBox(),
                          items: List.generate(
                            countryData.data.length,
                            (index) => DropdownMenuItem(
                              value: countryData.data[index],
                              child: Text(countryData.data[index].name),
                            ),
                          ),
                          onChanged: (Object? value) {
                            setState(() {
                              dropDownValue = value;
                            });
                          },
                        ),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 14.h),
              GetBuilder<CountriesViewModel>(
                builder: (controller11) {
                  if (controller11.apiResponse.status == Status.COMPLETE) {
                    CountriesResponseModel data = controller11.apiResponse.data;
                    return CommonDropdownButton(
                      onChanged: (value) {
                        setState(() {
                          value = controller11.selected;
                        });
                      },
                      hintText: "selecte country",
                      widget: ListView.builder(
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          return Text(data.data[index].name);
                        },
                      ),
                      value: controller11.selected,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
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
                hintText: "Enter mobile number",
                controller: singleFormViewModel.enterMobileNumber,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Take picture of number on band",
                controller: singleFormViewModel.takePictureOfNumberOnBand,
              ),
              SizedBox(height: 14.h),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Signature",
                controller: singleFormViewModel.signature,
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
