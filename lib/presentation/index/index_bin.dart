import 'package:get/get.dart';
import 'package:prime_derma_blog/presentation/index/index_controller.dart';

class IndexBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SkinCareAwareController());
  }
}
