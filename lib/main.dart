import 'package:entrance/app/common/constants.dart';
import 'package:entrance/app/common/storage/storage.dart';
import 'package:entrance/app/common/values/strings.dart';
import 'package:entrance/app/common/values/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/common/util/exports.dart';
import 'app/common/util/initializer.dart';
import 'app/routes/app_pages.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 818),
      builder: (context, widget) => GetMaterialApp(
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context),
            child: widget ?? const SizedBox.shrink(),
          );
        },
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        defaultTransition: Transition.rightToLeftWithFade,
        initialRoute: Routes.auth,
        getPages: AppPages.routes,
        initialBinding: InitialBindings(),
      ),
    );
  }
}
