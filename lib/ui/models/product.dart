import 'dart:convert';

class Product {
  final String articleCode;
  final String shopCode;
  final DateTime availableFrom;
  final DateTime availableUntil;
  final double eatOutPrice;
  final double eatInPrice;
  final String articleName;
  final List<String> dayParts;
  final String internalDescription;
  final String customerDescription;
  final String imageUri;
  final String thumbnailUri;

  Product({
    required this.articleCode,
    required this.shopCode,
    required this.availableFrom,
    required this.availableUntil,
    required this.eatOutPrice,
    required this.eatInPrice,
    required this.articleName,
    required this.dayParts,
    required this.internalDescription,
    required this.customerDescription,
    required this.imageUri,
    required this.thumbnailUri,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      articleCode: json['articleCode'],
      shopCode: json['shopCode'],
      availableFrom: DateTime.parse(json['availableFrom']),
      availableUntil: DateTime.parse(json['availableUntil']),
      eatOutPrice: json['eatOutPrice'].toDouble(),
      eatInPrice: json['eatInPrice'].toDouble(),
      articleName: json['articleName'],
      dayParts: List<String>.from(json['dayParts']),
      internalDescription: json['internalDescription'],
      customerDescription: json['customerDescription'],
      imageUri: json['imageUri'],
      thumbnailUri: json['thumbnailUri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'articleCode': articleCode,
      'shopCode': shopCode,
      'availableFrom': availableFrom.toIso8601String(),
      'availableUntil': availableUntil.toIso8601String(),
      'eatOutPrice': eatOutPrice,
      'eatInPrice': eatInPrice,
      'articleName': articleName,
      'dayParts': dayParts,
      'internalDescription': internalDescription,
      'customerDescription': customerDescription,
      'imageUri': imageUri,
      'thumbnailUri': thumbnailUri,
    };
  }
}
