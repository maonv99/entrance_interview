import 'package:entrance/app/common/util/exports.dart';
import 'package:entrance/app/modules/auth/views/widgets/export.dart';
import 'package:entrance/app/modules/category/controllers/category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widgets/export.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      urlImage: AppImages.categoryImg,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          children: <Widget>[
            const ButtonDoneWidget(),
            Text(
              Strings.titleCategory,
              style: AppTextStyle.titleStyle,
            ),
            SizedBox(width: 0.0, height: 10.h),
            Text(
              Strings.descriptionChooseCategory,
              style: AppTextStyle.bodySmall14Style,
            ),
            SizedBox(width: 0.0, height: 20.h),
            controller.obx(
              (state) {
                return GridViewCategory(model: state);
              },
              onLoading: const Center(
                child: CupertinoActivityIndicator(color: Colors.white),
              ),
              onEmpty: Center(
                child: Text(
                  Strings.emptyData,
                  style: AppTextStyle.regularBlandStyle,
                ),
              ),
              onError: (e) => Center(
                child: Text(
                  e.toString(),
                  style: AppTextStyle.regularBlandStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
