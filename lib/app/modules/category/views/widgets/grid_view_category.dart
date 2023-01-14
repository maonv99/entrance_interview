import 'package:entrance/app/common/util/exports.dart';
import 'package:entrance/app/data/models/category_model/category_model.dart';
import 'package:flutter/material.dart';

import 'export.dart';

class GridViewCategory extends StatelessWidget {
  final CategoryModel? model;
  const GridViewCategory({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            childAspectRatio: (1 / .8),
            mainAxisSpacing: 10),
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 18.h),
        itemCount: model?.categories?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final String? item = model?.categories?[index].name;
          return ItemCategoryWidget(item: item);
        },
      ),
    );
  }
}
