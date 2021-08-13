import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_public_api_getx/app/bndings/init_binding.dart';
import 'package:flutter_public_api_getx/app/routes/app_pages.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:get/route_manager.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter PublicApi App',
      initialBinding: InitBinding(),
      theme: ThemeData(primaryColor: primaryColor),
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
