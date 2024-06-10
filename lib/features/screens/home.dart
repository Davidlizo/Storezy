import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storezy/features/app_theme.dart';
import 'package:storezy/features/controllers/store_controller.dart';
import 'package:storezy/features/controllers/theme_controller.dart';
import 'package:storezy/features/widgets/card.dart';

import '../widgets/nav_drawer.dart';

class Home extends GetView<StoreController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final controller = Get.find<StoreController>();

    return Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: const Text('Storezy'),
          actions: [
            IconButton(
                onPressed: () {
                  if (Get.isDarkMode) {
                    themeController.changeTheme(Themes.lightTheme);
                    themeController.saveTheme(false);
                  } else {
                    themeController.changeTheme(Themes.darkTheme);
                    themeController.saveTheme(true);
                  }
                },
                icon: Get.isDarkMode
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined))
          ],
        ),
        drawer: const NavDrawer(),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MainCard(
                  title: 'Store Info',
                  body: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            fit: FlexFit.tight,
                            child: Text('Store name:'),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Obx(
                            () => Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                    controller.storeName.value.toString())),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            fit: FlexFit.tight,
                            child: Text('Store followers:'),
                          ),
                          Obx(() => Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                  'With Obx:${controller.folllowerCount.value.toString()}'))),
                          GetBuilder<StoreController>(
                            builder: (_) => Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'With GetBuilder: ${controller.folllowerCount.value.toString()}',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text('Status:'),
                          ),
                          GetX<StoreController>(
                              builder: (controller) => Text(
                                  controller.storeStatus.value
                                      ? 'Open'
                                      : 'Closed')),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MainCard(
                    title: 'Followers',
                    body: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.followerList.length,
                      itemBuilder: (context, index) {
                        return Text(controller.followerList[index].toString());
                      },
                    ))),
                const SizedBox(
                  height: 20,
                ),
                MainCard(
                    title: 'Reviews',
                    body:Obx(() =>  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.reviews.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.reviews[index].name),
                          subtitle: Text(controller.reviews[index].review),
                        );
                      },
                    ))),
              ],
            ),
          ),
        ));
  }
}
