import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';
import '../../consts/text_style.dart';

void customSnackBar(String title, Color color) {
  Get.snackbar("", title,
      margin: const EdgeInsets.only(bottom: 70, right: 32, left: 32),
      titleText: const SizedBox(),
      messageText: Text(title,
          textAlign: TextAlign.center,
          style: TextStyles.textMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          maxLines: 10),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      duration: const Duration(milliseconds: 3000),
      colorText: Colors.white);
}
