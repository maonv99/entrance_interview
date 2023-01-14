import 'category.dart';

class CategoryModel {
  List<Category>? categories;
  int? totalCount;

  CategoryModel({this.categories, this.totalCount});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalCount: json['totalCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
        'totalCount': totalCount,
      };
}
