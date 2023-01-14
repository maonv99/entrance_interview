import 'package:flutter/material.dart';

import '../../../../common/util/exports.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 170.h, bottom: 40.h),
      child: Text(
        Strings.titleSignUp,
        style: AppTextStyle.titleStyle,
      ),
    );
  }
}
