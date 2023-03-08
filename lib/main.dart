import 'package:flutter/material.dart';
import '/pages/authentication/auth_controller.dart';
import '/constants/style.dart';
import '/controllers/menu_controller.dart';
import '/controllers/navigation_controller.dart';

import '/layout.dart';
import '/pages/404/error.dart';
import '/pages/authentication/authentication.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/authentication/binding.dart';
import 'pages/login/login_screen.dart';
import 'pages/overview/widgets/overview_controller.dart';
import 'routing/routes.dart';
import 'translation/translation.dart';

void main() {
  Get.put(NavigationController());
  Get.put(MenuController());

  Get.put(AuthController(), permanent: true);
  // Get.put(OverViewController(),permanent: true);

  // Get.lazyPut(() => AuthController(AuthenticationPage()), fenix: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      //  initialBinding: InitialBinding(),
      initialRoute: authenticationPageRoute,
      //  initialRoute: loginPageRoute,

      unknownRoute: GetPage(
          name: '/not-found',
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(
            name: authenticationPageRoute, page: () => AuthenticationPage()),
        //  GetPage(name: loginPageRoute, page: () => LogIn()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      // home: AuthenticationPage(),
    );
  }
}
