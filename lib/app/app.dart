import 'package:flutter_greggs_app/services/basket_api_service.dart';
import 'package:flutter_greggs_app/services/mock_api_service.dart';
import 'package:flutter_greggs_app/ui/views/home/home_view.dart';
import 'package:flutter_greggs_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: MockApiService),
    LazySingleton(classType: BasketApiService),
    // @stacked-service
  ],
)
class App {}
