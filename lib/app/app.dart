import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/app_binding.dart';
import 'package:suitmedia/app/utils/themes.dart';
import 'package:suitmedia/app/views/screen/first/first_screen.dart';
import 'package:suitmedia/app/views/screen/fourth/fourth_screen.dart';
import 'package:suitmedia/app/views/screen/second/second_screen.dart';
import 'package:suitmedia/app/views/screen/third/third_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.myThemes,
      initialBinding: AppBinding(),
      initialRoute: FirstScreen.route,
      getPages: [
        GetPage(
          name: FirstScreen.route,
          page: () => FirstScreen(),
        ),
        GetPage(
          name: SecondScreen.route,
          page: () => SecondScreen(),
        ),
        GetPage(
          name: ThirdScreen.route,
          page: () => ThirdScreen(),
        ),
        GetPage(
          name: FourthScreen.route,
          page: () => FourthScreen(),
        ),
      ],
    );
  }
}
