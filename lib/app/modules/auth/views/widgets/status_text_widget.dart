import 'package:entrance/app/common/util/exports.dart';
import 'package:entrance/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StatusTextWidget extends GetView<AuthController> {
  const StatusTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.only(top: 8.h),
          alignment: Alignment.centerRight,
          child: Text(
            controller.statusPassText.value,
            style: AppTextStyle.regularStyle.copyWith(
                fontSize: 12.sp, color: controller.getColorProgress()),
          ),
        ));
  }
}
