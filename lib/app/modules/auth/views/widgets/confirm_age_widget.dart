import 'package:entrance/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/util/exports.dart';
import '../../../widgets/custom_check_box.dart';

class ConfirmAgeWidget extends GetView<AuthController> {
  const ConfirmAgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 28.h),
      child: Row(
        children: [
          Obx(() => CustomCheckBox(
                value: controller.over16Years.value,
                onChanged: (value) {
                  controller.over16Years.toggle();
                },
              )),
          Text(
            Strings.over16Age,
            style: AppTextStyle.regularStyle,
          )
        ],
      ),
    );
  }
}
