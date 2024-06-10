import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storezy/features/models/reviews.dart';

import '../constants/colors.dart';
import '../controllers/store_controller.dart';
import '../widgets/rounded_input.dart';

class AddReviews extends StatelessWidget {
  AddReviews({super.key});
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(title: const Text('Add Reviews'),),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Add A Review',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedInput(
                        hintText: 'Reviwer Name',
                        controller: storeController.reviewNameController,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      RoundedInput(
                        hintText: 'Write Review',
                        controller: storeController.reviewEditingController,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var reviews = StoreReviews(
                              name: storeController.reviewNameController.text,
                              review:
                                  storeController.reviewEditingController.text);
                          storeController.addReview(reviews);
                          Get.snackbar('Review Added',
                              'New Review Added by \n ${storeController.reviewNameController.text}',
                              snackPosition: SnackPosition.BOTTOM);
                          storeController.reviewNameController.clear();
                          storeController.reviewEditingController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lavender,
                            fixedSize: const Size(100, 45)),
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: Get.isDarkMode
                                  ? Colors.black
                                  : Colors.white70),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const Text(
                        'Added Reviews:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Obx(() => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: storeController.reviews.length,
                          itemBuilder: (context, index) {
                            List<StoreReviews> storeReviews = storeController
                                .reviews
                                .map((item) => StoreReviews(
                                    name: item.name, review: item.review))
                                .toList();
                            return ListTile(
                              title: Text(storeReviews[index].name),
                              subtitle: Text(storeReviews[index].review),
                            );
                          })),
                    ],
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
