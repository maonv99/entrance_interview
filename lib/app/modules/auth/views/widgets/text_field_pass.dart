import 'package:entrance/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/util/exports.dart';
import '../../../widgets/text_field_widget.dart';

class TextFieldPass extends GetView<AuthController> {
  const TextFieldPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFieldWidget(
        key: controller.keyPassword,
        controller: controller.passwordText,
        labelText: Strings.yourPass,
        colorProgress: controller.getColorProgress(),
        percent: controller.percent.value,
        suffixIcon: InkWell(
          onTap: () => controller.obscureTextPass.toggle(),
          child: Icon(
            controller.obscureTextPass.value
                ? Icons.visibility
                : Icons.visibility_off,
            size: Dimens.fontSize20,
            color: AppColors.kIconEyesColor,
          ),
        ),
        obscureText: controller.obscureTextPass.value,
      ),
    );
  }
}
