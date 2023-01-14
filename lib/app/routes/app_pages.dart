import 'package:entrance/app/modules/category/bindings/category_binding.dart';
import 'package:entrance/app/modules/category/views/category_view.dart';
import 'package:get/get.dart';
import 'package:entrance/app/modules/auth/bindings/auth_bindings.dart';
import 'package:entrance/app/modules/auth/views/auth_view.dart';
part 'app_routes.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.auth,
      transition: Transition.rightToLeftWithFade,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.category,
      transition: Transition.rightToLeftWithFade,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
  ];
}
