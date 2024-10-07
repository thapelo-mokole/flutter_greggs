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
    // @stacked-service
  ],
)
class App {}
