import 'dart:convert';

import 'package:flutter_greggs_app/ui/models/product.dart';

class MockApiService {
  Future<List<Product>> fetchProducts() async {
    String responseJson = '''[
    {
      "articleCode": "1000446",
      "shopCode": "1234",
      "availableFrom": "2020-12-30T00:00:00Z",
      "availableUntil": "2045-05-13T23:59:59Z",
      "eatOutPrice": 1.05,
      "eatInPrice": 1.15,
      "articleName": "Sausage Roll",
      "dayParts": [
        "Breakfast",
        "Lunch",
        "Evening"
      ],
      "internalDescription": "Sausage Roll",
      "customerDescription": "The Nation’s favourite Sausage Roll.\\n\\nMuch like Elvis was hailed the King of Rock, many have appointed Greggs as the (unofficial) King of Sausage Rolls.\\n\\nFreshly baked in our shops throughout the day, this British classic is made from seasoned sausage meat wrapped in layers of crisp, golden puff pastry, as well as a large dollop of TLC. It’s fair to say, we’re proper proud of them.\\n\\nAnd that’s it. No clever twist. No secret ingredient. It’s how you like them, so that’s how we make them.\\n\\n",
      "imageUri": "https://articles.greggs.co.uk/images/1000446.png?1623244287449",
      "thumbnailUri": "https://articles.greggs.co.uk/images/1000446-thumb.png?1623244287450"
    },
    {
      "articleCode": "1000447",
      "shopCode": "1235",
      "availableFrom": "2021-01-01T00:00:00Z",
      "availableUntil": "2045-06-14T23:59:59Z",
      "eatOutPrice": 2.05,
      "eatInPrice": 2.15,
      "articleName": "Chicken Roll",
      "dayParts": [
        "Breakfast",
        "Lunch"
      ],
      "internalDescription": "Chicken Roll",
      "customerDescription": "The Nation’s favourite Sausage Roll.\\n\\nMuch like Elvis was hailed the King of Rock, many have appointed Greggs as the (unofficial) King of Sausage Rolls.\\n\\nFreshly baked in our shops throughout the day, this British classic is made from seasoned sausage meat wrapped in layers of crisp, golden puff pastry, as well as a large dollop of TLC. It’s fair to say, we’re proper proud of them.\\n\\nAnd that’s it. No clever twist. No secret ingredient. It’s how you like them, so that’s how we make them.\\n\\n",
      "imageUri": "https://articles.greggs.co.uk/images/1000447.png?1623244287449",
      "thumbnailUri": "https://articles.greggs.co.uk/images/1000447-thumb.png?1623244287450"
    }
    ]
    ''';

    await Future.delayed(const Duration(seconds: 3));

    List<dynamic> data = jsonDecode(responseJson);

    List<Product> products =
        data.map((productJson) => Product.fromJson(productJson)).toList();

    return products;
  }
}
