import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../controllers/store_controller.dart';
import '../widgets/rounded_input.dart';

class AddFollowers extends StatelessWidget {
  AddFollowers({super.key});
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(title: const Text('Add Followers'),),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Add A Follower',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    RoundedInput(
                        hintText: 'Add Followers',
                        controller: storeController.followerController),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        storeController.addNewFollower(
                            storeController.followerController.text);
                        Get.snackbar('Follower Added',
                            'New follower added \n ${storeController.followerController.text}',
                            snackPosition: SnackPosition.BOTTOM);
                        storeController.followerController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lavender,
                          fixedSize: const Size(100, 40)),
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.black : Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
