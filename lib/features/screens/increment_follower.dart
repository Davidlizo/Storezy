import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/store_controller.dart';

class IncrementFollowers extends StatelessWidget {
  IncrementFollowers({super.key});
  final controller = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text('Increase Followers'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementStoreFollowers();
          controller.updateFollowerCount();
        },
        child: const Icon(Icons.add),
      ),
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
                    'Number Of Folllowers',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Obx(() => Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                        'With Obs:${controller.folllowerCount.value.toString()}'))),
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
          ),
        ),
      ),
    );
  }
}
