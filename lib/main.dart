import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:storezy/features/app_theme.dart';
import 'package:storezy/features/screens/store_name.dart';
import 'package:storezy/features/screens/store_status_toggle.dart';
import 'package:storezy/features/services/storage_service.dart';
//import 'package:storezy/features/widgets/home_two.dart';

import 'features/bindings/store_binding.dart';
import 'features/controllers/theme_controller.dart';
import 'features/screens/add_followers.dart';
import 'features/screens/add_reviews.dart';
import 'features/screens/home.dart';
import 'features/screens/increment_follower.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Storezy',
      theme: Themes.lightTheme,
      initialBinding: StoreBinding(),
      darkTheme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: themeController.theme,
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/store_name', page: () => StoreName()),
        GetPage(name: '/add_follower', page: () => AddFollowers()),
        GetPage(name: '/store_status', page: () => StoreStatusToggle()),
        GetPage(name: '/add_reviews', page: () => AddReviews()),
        GetPage(name: '/increment_follower', page: () => IncrementFollowers()),
      ],
      initialRoute: '/',
      home: const Home(),
    );
  }
}
