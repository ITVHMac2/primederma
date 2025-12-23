import 'package:get/get.dart';
import 'package:prime_derma_blog/presentation/blog/blog_con.dart';

class BlogBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogCon());
  }
}
