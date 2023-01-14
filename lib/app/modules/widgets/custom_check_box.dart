import 'package:flutter/material.dart';

import '../../common/util/exports.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  const CustomCheckBox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: AppColors.kBlueLight,
        fillColor: MaterialStateProperty.all(Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: 2.borderRadius),
        checkColor: Colors.white,
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(width: 0.5, color: AppColors.kBlueLight),
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        value: value,
        onChanged: onChanged);
  }
}
