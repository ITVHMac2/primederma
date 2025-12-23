import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkinCareAwareController extends GetxController {
  final showBadge = true.obs;

  // Section keys for scroll-to
  final aboutKey = GlobalKey();
  final typesKey = GlobalKey();
  final signsKey = GlobalKey();
  final preventionKey = GlobalKey();
  final ctaKey = GlobalKey();

  final scrollController = ScrollController();

  void closeBadge() => showBadge.value = false;

  void scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;

    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  void onAbout() => scrollTo(aboutKey);
  void onTypes() => scrollTo(typesKey);
  void onSigns() => scrollTo(signsKey);
  void onPrevention() => scrollTo(preventionKey);
  void onGetChecked() => scrollTo(ctaKey);

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
