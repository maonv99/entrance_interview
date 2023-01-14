import 'package:entrance/app/common/constants.dart';
import 'package:entrance/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/util/validators.dart';
import '../../../data/repository/api_helper.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/text_field_widget.dart';

class AuthController extends GetxController {
  final ApiHelper _apiHelper = Get.find();

  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  final GlobalKey<TextFieldWidgetState> keyEmail =
      GlobalKey<TextFieldWidgetState>();
  final GlobalKey<TextFieldWidgetState> keyPassword =
      GlobalKey<TextFieldWidgetState>();
  Rx<StatusPass> statusPass = StatusPass.none.obs;
  RxDouble percent = 0.0.obs;
  RxString statusPassText = "".obs;
  RxBool over16Years = true.obs;
  RxBool isDisabledButton = true.obs;
  RxBool obscureTextPass = true.obs;

  @override
  void onInit() {
    emailText.addListener(() {
      checkStatusButton();
      onChangedTextEmail();
    });
    passwordText.addListener(() {
      checkStatusButton();
      onChangedTextPass();
      checkedStatusPass();
    });
    super.onInit();
  }

  checkStatusButton() {
    final String email = emailText.text.trim();
    final String pass = passwordText.text.trim();
    if (!email.isNullOrEmpty &&
        !pass.isNullOrEmpty &&
        (pass.length >= 6 && pass.length <= 18) &&
        GetUtils.isEmail(email)) {
      isDisabledButton(false);
    } else {
      isDisabledButton(true);
    }
  }

  signUpAccount() {
    final String email = emailText.text.trim();
    final String pass = passwordText.text.trim();

    if (!isDisabledButton.value) {
      _apiHelper.signUp(email: email, password: pass).futureValue((value) {
        final String? token = value["token"];
        saveToken(token);
        Get.toNamed(Routes.category);
      }, onError: (error) {
        Utils.closeDialog();
        Get.showSnackbar(
          GetSnackBar(
            title: Strings.notification,
            message: error.toString(),
          ),
        );
      }, retryFunction: () {});
    }
  }

  onChangedTextEmail() {
    final String email = emailText.text.trim();
    if (email.isNullOrEmpty) {
      keyEmail.currentState?.setError(Strings.emailCantBeEmpty);
    } else if (!GetUtils.isEmail(email)) {
      keyEmail.currentState?.setError(Strings.enterValidEmail);
    } else {
      keyEmail.currentState?.clear();
    }
  }

  onChangedTextPass() {
    final String pass = passwordText.text.trim();
    if (pass.isNullOrEmpty) {
      keyPassword.currentState?.setError(Strings.passwordCantBeEmpty);
    } else if (pass.length < 6 || pass.length > 18) {
      keyPassword.currentState?.setError(Strings.passwordBetween16And18);
    } else {
      keyPassword.currentState?.clear();
    }
  }

  saveToken(String? token) {
    if (!token.isNullOrEmpty) {
      Storage.saveValue(Constants.token, "Bearer $token");
    }
  }

  checkedStatusPass() {
    final String pass = passwordText.text.trim();
    final bool hasMatchUpperAndLower =
        Validators.validateUppercaseAndLowercase(pass);
    final bool hasMatchNumber = Validators.validateNumber(pass);
    final bool hasMatchSpecial = Validators.validateSpecial(pass);
    if (hasMatchUpperAndLower || hasMatchNumber || hasMatchSpecial) {
      if (hasMatchSpecial && hasMatchUpperAndLower && hasMatchNumber) {
        statusPass.value = StatusPass.strong;
      } else if (hasMatchUpperAndLower && hasMatchNumber) {
        statusPass.value = StatusPass.good;
      } else if (hasMatchSpecial && hasMatchNumber) {
        statusPass.value = StatusPass.good;
      } else if (hasMatchSpecial && hasMatchUpperAndLower) {
        statusPass.value = StatusPass.good;
      } else {
        statusPass.value = StatusPass.fair;
      }
    } else {
      statusPass.value = StatusPass.weak;
    }
    caculatePercent();
  }

  caculatePercent() {
    switch (statusPass.value) {
      case StatusPass.weak:
        statusPassText(Strings.weak);
        return percent(0.25);
      case StatusPass.fair:
        statusPassText(Strings.fair);
        return percent(0.5);
      case StatusPass.good:
        statusPassText(Strings.good);
        return percent(0.75);
      case StatusPass.strong:
        statusPassText(Strings.strong);
        return percent(1);
      default:
        return percent(0);
    }
  }

  Color? getColorProgress() {
    switch (statusPass.value) {
      case StatusPass.weak:
        return const Color(0xFFE05151);
      case StatusPass.fair:
        return const Color(0xFFE3A063);
      case StatusPass.good:
        return const Color(0xFF647FFF);
      case StatusPass.strong:
        return const Color(0xFF91E2B7);
      default:
        return null;
    }
  }
}

enum StatusPass { none, weak, fair, good, strong }
