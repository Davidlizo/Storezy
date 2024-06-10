import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storezy/features/controllers/store_controller.dart';

class StoreStatusToggle extends StatelessWidget {
  StoreStatusToggle({super.key});
  final controller = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(title: const Text('Store Status'),),
      body: Center(
        child: Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
          child: Column(
            children: [
               Padding(
                padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 100.0),
                child:Text(
              'Store open?',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Obx(() =>  Switch(
              value: controller.storeStatus.value,
              onChanged: (value) => controller.storeStatus(value),
              activeColor: Colors.green,
            ),),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
