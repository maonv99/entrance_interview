import 'package:entrance/app/common/util/exports.dart';
import 'package:entrance/app/modules/category/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCategoryWidget extends GetView<CategoryController> {
  final String? item;
  const ItemCategoryWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.changeCategoryToList(item);
        },
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: 8.borderRadius,
              border: Border.all(
                width: 0.5,
                color: AppColors.white,
              ),
              gradient: LinearGradient(
                  stops: const [0.0, 0.8],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: _buildColorGradient(item)),
            ),
            child: Text(
              item ?? "",
              style: AppTextStyle.bodySmall14Style,
            )),
      ),
    );
  }

  _buildColorGradient(String? item) {
    return controller.hasData(item)
        ? [
            AppColors.kPurpleColorLight,
            AppColors.kPurpleColor,
          ]
        : [Colors.black, Colors.black];
  }
}
