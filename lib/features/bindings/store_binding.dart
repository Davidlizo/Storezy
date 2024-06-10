import 'package:get/get.dart';
import 'package:storezy/features/controllers/store_controller.dart';
import 'package:storezy/features/services/provider.dart';
import 'package:storezy/features/services/repository.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController(
        repository: ReviewRepository(storeProvider: StoreProvider())));
  }
}
