import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_style.dart';

import '../../../../enums/buttons_states.dart';
import '../../../../uitls/buttons/loading_fill_custom_button.dart';
import '../../../../uitls/text_field/defult_text_form_field.dart';
import '../../../../uitls/text_field/email_text_field.dart';
import '../controllers/update_info_controller.dart';

class UpdateInfoView extends GetView<UpdateInfoController> {
  UpdateInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Update Information",
            style: TextStyles.textSemiBold
                .copyWith(fontSize: 24.sp, color: Color(ColorCode.white)),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              DefaultTextFormField(
                controller: controller.nameController,
                hint: "name",
              ),
              SizedBox(
                height: 16.h,
              ),
              CountryListPick(
                pickerBuilder: (context, CountryCode? countryCode) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1.5, color: const Color(ColorCode.gray2))),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 36.w,
                          width: 36.w,
                          child: Image.asset(
                            countryCode?.flagUri ?? "",
                            package: 'country_list_pick',
                          ),
                        ),
                        Text(countryCode?.dialCode ?? "$countryCode"),
                        Container()
                      ],
                    ),
                  );
                },
                theme: CountryTheme(
                  isShowFlag: true,
                  isShowTitle: false,
                  isShowCode: true,
                  isDownIcon: false,
                  showEnglishName: false,
                  labelColor: Colors.black,
                ),
                initialSelection: '${controller.countryCode}',
                onChanged: (country) {
                  controller.countryCode = country?.code.toString() ?? "";
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              EmailTextField(
                controller: controller.emailController,
                hint: "Email Address",
              ),
              SizedBox(
                height: 24.h,
              ),
              updateButton(),
            ],
          ),
        ));
  }

  Widget updateButton() {
    return GetBuilder<UpdateInfoController>(builder: (context) {
      return LoadingFillCustomButton(
        onPressed: () {
          controller.onUpdateClicked();
        },
        buttonState: controller.isUpdateLoading.value
            ? ButtonState.Loading
            : ButtonState.Enable,
        lable: 'Save',
      );
    });
  }
}
