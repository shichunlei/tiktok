import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/log_utils.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

import 'logic.dart';

class WithdrawalPage extends StatelessWidget {
  WithdrawalLogic get logic => Get.find<WithdrawalLogic>();

  const WithdrawalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Withdrawal"), centerTitle: true),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("USDT withdrawal address", style: TextStyle(color: Colors.white, fontSize: 18.sp)),
              SizedBox(height: 10.h),
              TextField(
                  controller: logic.addressController,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                      hintText: "Please enter the withdrawal address",
                      contentPadding: EdgeInsets.zero,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal))),
              SizedBox(height: 10.h),
              Row(children: [
                Text("Select network", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                SizedBox(width: 10.w),
                Obx(() {
                  return DropdownMenu<String>(
                      width: 230.w,
                      onSelected: (value) {
                        Log.d("$value");
                        logic.networkChannelId.value = value;
                      },
                      inputDecorationTheme: InputDecorationTheme(
                          outlineBorder: const BorderSide(color: Colors.white),
                          border: const OutlineInputBorder(gapPadding: 0),
                          hintStyle: const TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w)),
                      dropdownMenuEntries: List.generate(
                          logic.addresses.length,
                          (index) => DropdownMenuEntry(
                              value: "${logic.addresses[index].id}", label: '${logic.addresses[index].name}')),
                      hintText: "Please select",
                      menuStyle: const MenuStyle(padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero)),
                      selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
                      trailingIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      textStyle: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500));
                })
              ]),
              SizedBox(height: 10.h),
              Text("Arrival time: Within 24 hours", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              SizedBox(height: 25.h),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Withdrawal amount ", style: TextStyle(fontSize: 17.sp)),
                TextSpan(text: "Minimum withdrawal of 5.4 USDT", style: TextStyle(fontSize: 12.sp))
              ], style: const TextStyle(color: Colors.white))),
              SizedBox(height: 10.h),
              Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
                  child: Row(children: [
                    Text("\$", style: TextStyle(fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.w700)),
                    Expanded(
                        child: TextField(
                            controller: logic.priceController,
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                                border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 5.w))))
                  ])),
              SizedBox(height: 10.h),
              Text("Withdrawal amount: 1231 USDT", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              SizedBox(height: 30.h),
              Row(children: [
                Text("Enter password:", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                SizedBox(
                    width: .5.sw,
                    child: TextField(
                        controller: logic.passwordController,
                        style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                            hintText: "enter password",
                            contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal))))
              ]),
              RadiusInkWellWidget(
                  margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  onPressed: logic.confirm,
                  color: Colors.white,
                  radius: 4.r,
                  child: Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      child: Text("confirm",
                          style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)))),
              Center(child: Obx(() {
                return Text(
                    "Withdrawal service free charged at ${logic.withdrawalRecordInfo.value?.serviceCharge}% USDT",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp));
              }))
            ])));
  }
}
