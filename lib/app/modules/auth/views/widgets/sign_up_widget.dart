import 'package:entrance/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../common/util/exports.dart';

class SignUpWidget extends GetView<AuthController> {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          Strings.signUp,
          style: AppTextStyle.textButtonSmallStyle,
        ),
        Obx(
          () => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: controller.isDisabledButton.value
                      ? Colors.white38
                      : AppColors.kBlueLight,
                )),
            child: IconButton(
              onPressed: () {
                controller.signUpAccount();
              },
              icon: Icon(
                Icons.arrow_right_alt,
                color: controller.isDisabledButton.value
                    ? Colors.white38
                    : Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
