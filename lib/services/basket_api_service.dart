import 'package:flutter_greggs_app/ui/models/basket_item.dart';

class BasketApiService {
  final Map<String, BasketItem> _items = {};

  Map<String, BasketItem> get items {
    return {..._items};
  }

  void addItem(String code, String name, double price) {
    if (_items.containsKey(code)) {
      _items[code]!.quantity++;
    } else {
      _items.putIfAbsent(
          code, () => BasketItem(code: code, name: name, price: price));
    }
    print(_items);
  }

  void removeItem(String code) {
    if (!_items.containsKey(code)) {
      return;
    }
    if (_items[code]!.quantity > 1) {
      _items[code]!.quantity--;
    } else {
      _items.remove(code);
    }
  }

  double get totalItems {
    return _items.values
        .fold(0, (total, item) => (total + item.price * item.quantity));
  }

  void clearBasket() {
    _items.clear();
  }
}
