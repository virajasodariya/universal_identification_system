import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Api/status.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Model/Response/all_forms_response_model.dart';
import 'package:universal_identification_system/View/HomeScreen/form.dart';
import 'package:universal_identification_system/ViewModel/all_forms_view_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  AllFormsViewModel allFormsViewModel = Get.put(AllFormsViewModel());

  @override
  void initState() {
    allFormsViewModel.allFormsViewModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   child: GetBuilder<GetAllFormsViewModel>(
    //     builder: (controller) {
    //       if (controller.apiResponse.status == status.Status.COMPLETE) {
    //         GetAllFormsResponseModel responseModel =
    //             controller.apiResponse.data;
    //         return Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 20.w),
    //           child: Column(
    //             children: [
    //               SizedBox(height: 20.h),
    //               Column(
    //                 children: List.generate(
    //                   responseModel.data.length,
    //                   (index) => Container(
    //                     height: 60.h,
    //                     width: 388.w,
    //                     margin: EdgeInsets.only(bottom: 6.h),
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(6.r),
    //                       boxShadow: [
    //                         BoxShadow(
    //                           color: Colors.grey.withOpacity(0.2),
    //                           spreadRadius: 7,
    //                           blurRadius: 7,
    //                           offset: const Offset(0, 2),
    //                         ),
    //                       ],
    //                     ),
    //                     child: Padding(
    //                       padding: EdgeInsets.symmetric(horizontal: 12.w),
    //                       child: Row(
    //                         children: [
    //                           Column(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceEvenly,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 responseModel.data[index].deceasedName,
    //                                 style: FontTextStyle.k31313116W400,
    //                               ),
    //                               Row(
    //                                 children: [
    //                                   Text(
    //                                     "Date of Death: ",
    //                                     style: FontTextStyle.k84848416W400,
    //                                   ),
    //                                   Text(
    //                                     '${responseModel.data[index].dateOfDeath}',
    //                                     style: FontTextStyle.k35353512W400,
    //                                   ),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                           const Spacer(),
    //                           GestureDetector(
    //                             onTap: () {},
    //                             child: Container(
    //                               height: 30.h,
    //                               width: 98.w,
    //                               decoration: BoxDecoration(
    //                                 color: PickColor.k00529B,
    //                                 borderRadius: BorderRadius.circular(6.r),
    //                               ),
    //                               child: Center(
    //                                 child: Text(
    //                                   "View Details",
    //                                   style: FontTextStyle.kWhite14W400,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       } else {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   ),
    // );
    return SingleChildScrollView(
      child: GetBuilder<AllFormsViewModel>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            AllFormsResponseModel responseModel = controller.apiResponse.data;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Column(
                    children: List.generate(
                      responseModel.data.length,
                      (index) => Container(
                        height: 60.h,
                        width: 388.w,
                        margin: EdgeInsets.only(bottom: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 7,
                              blurRadius: 7,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    responseModel.data[index].deceasedName,
                                    style: FontTextStyle.k31313116W400,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Date of Death: ",
                                        style: FontTextStyle.k84848416W400,
                                      ),
                                      Text(
                                        '${responseModel.data[index].dateOfDeath}',
                                        style: FontTextStyle.k35353512W400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => const FormScreen(),
                                  );
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 98.w,
                                  decoration: BoxDecoration(
                                    color: PickColor.k00529B,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View Details",
                                      style: FontTextStyle.kWhite14W400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (controller.apiResponse.status == Status.ERROR) {
            return const Center(child: Text("ERROR"));
          } else if (controller.apiResponse.status == Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("SOMETHING WENT WRONG"));
          }
        },
      ),
    );
  }
}
