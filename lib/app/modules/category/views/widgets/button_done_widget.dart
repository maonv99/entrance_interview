import 'package:entrance/app/modules/category/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../common/util/exports.dart';

class ButtonDoneWidget extends GetView<CategoryController> {
  const ButtonDoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 112.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.chevron_left,
              size: 28.sp,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.saveCategory();
            },
            child: Text(
              Strings.done,
              style: AppTextStyle.bodySmall14Style,
            ),
          )
        ],
      ),
    );
  }
}
