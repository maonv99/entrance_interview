import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:entrance/app/common/util/exports.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? height;
  final InputBorder? enabledBorder;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? style;
  final Function(String)? onChanged;
  final bool readOnly;
  final Widget? prefixIcon;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final double? percent;
  final Color? colorProgress;
  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.suffixIcon,
      this.obscureText = false,
      this.height,
      this.enabledBorder,
      this.hintText,
      this.fillColor,
      this.borderColor,
      this.onChanged,
      this.style,
      this.readOnly = false,
      this.prefixIcon,
      this.onSubmitted,
      this.textInputAction,
      this.keyboardType,
      this.inputFormatters,
      this.validator,
      this.onTap,
      this.labelText,
      this.percent,
      this.colorProgress})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  String _errorText = "";
  Color borderColor = AppColors.kBlack56;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height ?? 44.h,
          child: TextFormField(
            style: widget.style ??
                AppTextStyle.regularStyle.copyWith(fontSize: 16.sp),
            cursorColor: AppColors.white,
            controller: widget.controller,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            scrollPadding: EdgeInsets.zero,
            readOnly: widget.readOnly,
            onFieldSubmitted: widget.onSubmitted,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            validator: widget.validator,
            onTap: widget.onTap,
            decoration: InputDecoration(
              filled: false,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintStyle: AppTextStyle.textButtonSmallStyle.copyWith(
                  fontSize: Dimens.fontSize16, color: AppColors.kBlackText),
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              labelText: widget.labelText,
              labelStyle: AppTextStyle.regularStyle.copyWith(
                fontSize: 12.sp,
                color: Colors.white.withOpacity(0.5),
              ),
              suffixIcon: widget.suffixIcon ??
                  (_errorText.isNullOrEmpty
                      ? null
                      : Icon(
                          Icons.error_outline,
                          size: Dimens.fontSize20,
                          color: AppColors.kButtonColor,
                        )),
              fillColor: widget.fillColor ?? Colors.transparent,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        LinearProgressIndicator(
          backgroundColor: AppColors.kBlackDot,
          minHeight: 2,
          color: widget.colorProgress ?? AppColors.kBlueLight,
          value: widget.percent == 0 ? 1.0 : widget.percent,
        ),
        if (!_errorText.isNullOrEmpty)
          Padding(
            padding: EdgeInsets.only(top: 6.h, left: 2.w),
            child: Text(
              _errorText,
              style: AppTextStyle.bodySmallStyle
                  .copyWith(color: AppColors.kButtonColor),
            ),
          )
      ],
    );
  }

  setError(String text) {
    setState(() {
      _errorText = text;
      borderColor = AppColors.kButtonColor;
    });
  }

  setColor(
    Color color,
  ) {
    setState(() {
      borderColor = color;
    });
  }

  clear() {
    setState(() {
      _errorText = "";
      borderColor = AppColors.kBlack56;
    });
  }
}
