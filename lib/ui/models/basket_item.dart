class BasketItem {
  final String code;
  final String name;
  final double price;
  int quantity;

  BasketItem({
    required this.code,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
