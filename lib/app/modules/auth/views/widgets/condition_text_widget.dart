import 'package:flutter/material.dart';

import '../../../../common/util/exports.dart';

class ConditionTextWidget extends StatelessWidget {
  const ConditionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: Strings.authCondition1,
                style: AppTextStyle.conditionNomalStyle),
            TextSpan(
              text: Strings.authCondition2,
              style: AppTextStyle.conditionStyle
                  .copyWith(color: AppColors.kPrimaryColor),
            ),
            TextSpan(
                text: Strings.authCondition3,
                style: AppTextStyle.conditionNomalStyle),
            TextSpan(
              text: Strings.authCondition4,
              style: AppTextStyle.conditionStyle
                  .copyWith(color: AppColors.kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
