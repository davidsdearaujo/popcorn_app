import 'package:flutter/material.dart';

import 'custom_dio.dart';

class DioNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route previousRoute) {
    CustomDioLoading.state$?.add(CustomDioLoading.state$?.value
        ?.copyWith(state: CustomDioLoadingState.none));
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    CustomDioLoading.state$?.add(CustomDioLoading.state$?.value
        ?.copyWith(state: CustomDioLoadingState.none));
    super.didPush(route, previousRoute);
  }
}
