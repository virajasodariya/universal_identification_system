import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/selection.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  SelectionController selectionController = Get.put(SelectionController());

  List name = [
    "Jane Cooper",
    "Wade Warren",
    "Esther Howard",
    "Brooklyn Simmons",
    "Jenny Wilson",
    "Guy Hawkins",
    "Albert Flores",
    "Ralph Edwards",
    "Annette Black",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 31.h),
          Column(
            children: List.generate(
              name.length,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name[index],
                            style: FontTextStyle.k31313116W400,
                          ),
                          Row(
                            children: [
                              Text(
                                "Date of Death: ",
                                style: FontTextStyle.k84848416W400,
                              ),
                              Text(
                                "26-03-2021",
                                style: FontTextStyle.k35353512W400,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
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
  }
}
