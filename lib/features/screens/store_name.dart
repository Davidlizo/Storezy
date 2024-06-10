import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storezy/features/widgets/rounded_input.dart';

import '../constants/colors.dart';
import '../controllers/store_controller.dart';

class StoreName extends StatelessWidget {
  StoreName({super.key});
  final storeController = Get.find<StoreController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(title: const Text('Store Name'),),
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
                  'Enter Store Name',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    RoundedInput(
                      hintText: 'Update Store Name',
                      controller: storeController.storenameEditingController,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        storeController.updateStoreName(
                            storeController.storenameEditingController.text);
                        Get.snackbar('Updated',
                            'Store name has been updated successfully to \n ${storeController.storenameEditingController.text}',
                            snackPosition: SnackPosition.BOTTOM);
                            storeController.storenameEditingController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lavender,
                          fixedSize: const Size(100, 40)),
                      child: Text(
                        'Update',
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.black : Colors.white70),
                      ),
                    )
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
