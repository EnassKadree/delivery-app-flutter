import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/base/base_cubit.dart';

class CategoriesSliderCubit extends BaseCubit<int> {
  CategoriesSliderCubit() : super(0);

  Timer? _timer;

  void startAutoScroll(BuildContext context, PageController controller, int totalQuotes) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      int nextPage = state + 1 < totalQuotes ? state + 1 : 0;
      controller.animateToPage(
        nextPage,
        duration: const Duration(seconds: 2),
        curve: Curves.ease,
      );
      emit(nextPage);
    });
  });
}


  void stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    stopAutoScroll();
    return super.close();
  }
}
