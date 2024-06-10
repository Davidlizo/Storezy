import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storezy/features/constants/colors.dart';

import '../screens/add_reviews.dart';
import 'custom_list_tile.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              child: Center(
            child: Text(
              'Storezy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          )),
          CustomListTile(
            leading: Icon(Icons.change_circle_sharp,
                color: Get.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue),
            title: Text(
              'Change store name',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue),
            ),
            onPressed: () {
              Get.offAndToNamed('/store_name');
            },
          ),
          CustomListTile(
            leading: Icon(Icons.add_reaction_sharp,
                color: Get.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue),
            title: Text(
              'Add followers',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue),
            ),
            onPressed: () {
              Get.offAndToNamed('/add_follower');
            },
          ),
          CustomListTile(
            leading: Icon(Icons.add_task_sharp,
                color: Get.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue),
            title: Text(
              'Increment Followers',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue),
            ),
            onPressed: () {
              Get.offAndToNamed('/increment_follower');
            },
          ),
          CustomListTile(
            leading: Icon(Icons.toggle_on_sharp,
                color: Get.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue),
            title: Text(
              'Toggle Store Status',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue),
            ),
            onPressed: () {
              Get.offAndToNamed('/store_status');
            },
          ),
          CustomListTile(
            leading: Icon(Icons.add_comment_sharp,
                color: Get.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue),
            title: Text(
              'Add Reviews',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue),
            ),
            onPressed: () {
              Get.to(AddReviews());
             Get.offAndToNamed('/add_reviews');
            },
          ),
        ],
      ),
    );
  }
}
