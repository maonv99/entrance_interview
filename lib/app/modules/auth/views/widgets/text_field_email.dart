import 'package:entrance/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../common/util/exports.dart';
import '../../../widgets/text_field_widget.dart';

class TextFieldEmail extends GetView<AuthController> {
  const TextFieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      key: controller.keyEmail,
      controller: controller.emailText,
      labelText: Strings.yourEmail,
      percent: 0,
      textInputAction: TextInputAction.done,
    );
  }
}
