import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/util/exports.dart';
import '../../../data/models/category_model/category_model.dart';
import '../../../data/repository/api_helper.dart';

class CategoryController extends GetxController with StateMixin<CategoryModel> {
  final String keyCategory = "list_category";
  final ApiHelper _apiHelper = Get.find();
  RxList<String> selectedCategory = <String>[].obs;

  @override
  void onInit() {
    fetchApi();

    super.onInit();
  }

  fetchApi() async {
    change(null, status: RxStatus.loading());
    final Response response = await _apiHelper.getListCategory();
    if (response.isOk) {
      final CategoryModel data = CategoryModel.fromJson(response.body);
      if (data.categories?.isEmpty ?? true) {
        change(null, status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    } else if (response.status.isServerError) {
      change(null, status: RxStatus.error(Strings.errorServer));
    } else if (response.status.connectionError) {
      change(null, status: RxStatus.error(Strings.errorConnect));
    } else {
      change(null, status: RxStatus.error(Strings.unknownError));
    }
  }

  changeCategoryToList(String? category) {
    if (category != null) {
      if (selectedCategory.contains(category)) {
        selectedCategory.remove(category);
      } else {
        selectedCategory.add(category);
      }
    }
  }

  saveCategory() {
    final List<String> categories = selectedCategory;
    if (categories.isNotEmpty) {
      Storage.saveValue(keyCategory, categories).then(
        (value) => Get.snackbar(Strings.notification, Strings.saveSusscessful,
            colorText: Colors.white),
      );
    } else {
      Get.snackbar(Strings.notification, Strings.selectCategory,
          colorText: Colors.white);
    }
  }

  bool hasData(String? category) {
    if (selectedCategory.contains(category)) {
      return true;
    }
    return false;
  }
}
