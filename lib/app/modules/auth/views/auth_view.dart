import 'package:entrance/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:entrance/app/modules/auth/controllers/auth_controller.dart';
import '../../widgets/text_field_widget.dart';
import 'widgets/export.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 0.0, height: 24.h),
            Icon(Icons.chevron_left, size: 30.sp, color: Colors.white),
            const TitleWidget(),
            const TextFieldEmail(),
            SizedBox(width: 0.0, height: 24.h),
            const TextFieldPass(),
            const StatusTextWidget(),
            const ConfirmAgeWidget(),
            const ConditionTextWidget(),
            const SignUpWidget()
          ],
        ),
      ),
    );
  }
}
