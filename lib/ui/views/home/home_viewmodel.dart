import 'package:flutter_greggs_app/app/app.locator.dart';
import 'package:flutter_greggs_app/services/basket_api_service.dart';
import 'package:flutter_greggs_app/services/mock_api_service.dart';
import 'package:flutter_greggs_app/ui/models/product.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<void> {
  final BasketApiService basketApiService = locator<BasketApiService>();
  final MockApiService _mockApiService = locator<MockApiService>();
  List<Product> products = [];

  Future<void> fetchData() async {
    try {
      setBusy(true);
      var results = await _mockApiService.fetchProducts();
      products.addAll(results);
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      setBusy(false);
    }
  }

  @override
  Future<void> futureToRun() => fetchData();

  @override
  void onError(error) {}

  void removeItem(String articleCode) {
    basketApiService.removeItem(articleCode);
    notifyListeners();
  }

  void addItem(String articleCode, String articleName, double eatInPrice) {
    basketApiService.addItem(articleCode, articleName, eatInPrice);
    notifyListeners();
  }
}
