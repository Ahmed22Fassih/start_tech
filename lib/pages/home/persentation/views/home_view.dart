import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:start_task/consts/colors.dart';

import '../../../../consts/text_style.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              "Home Page",
              style: TextStyles.textSemiBold
                  .copyWith(fontSize: 24.sp, color: Color(ColorCode.white)),
            ),
            centerTitle: true,
            leading: Container()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              gap(),
              showInfoItem(Icons.person_outline_sharp, "Samir"),
              gap(),
              showInfoItem(Icons.phone_android, "+201285829001"),
              gap(),
              showInfoItem(Icons.email, "ahmed@gmail.com"),
              gap(),
              sectionItem("Update Information", () {
                Get.toNamed(Routes.UPDATEINFO);
                // Get.to(Second());
              }),
              const Divider(),
              sectionItem("Change Password", () {}),
              const Divider(),
              sectionItem("Delete Account", () {}),
              const Divider(),
              sectionItem("Logout", () {}),
              const Divider(),
            ],
          ),
        ));
  }

  Widget sectionItem(String title, Function goToScreen) {
    return InkWell(
      onTap: () {
        goToScreen.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.textSemiBold
                  .copyWith(fontSize: 24.sp, color: Color(ColorCode.primary)),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(
                ColorCode.primary,
              ),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox gap() {
    return SizedBox(
      height: 36.h,
    );
  }

  Row showInfoItem(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color(
            ColorCode.primary,
          ),
          size: 24,
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: TextStyles.textMedium.copyWith(
              color: Color(
                ColorCode.gray2,
              ),
              fontSize: 20.sp),
        ),
      ],
    );
  }
}
