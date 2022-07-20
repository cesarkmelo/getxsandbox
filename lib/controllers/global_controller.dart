import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getsandbox/models/product.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  Map<String, Product> _favorites = Map();

  List<Product> get products => _products;
  Map<String, Product> get favorites => _favorites;

  @override
  onInit() {
    super.onInit();
    print("Inicio estado global");
    _loadProducts();
  }

  _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');

    _products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
    print("Productos han cargado");
    update(['products']);
  }

  onFavorite(int index, bool isFavorite) {
    Product product = _products[index];
    product.isFavorite = isFavorite;

    // agrega o elimina el producto a map de favoritos
    if (isFavorite) {
      _favorites[product.name] = product;
    } else {
      _favorites.remove(product.name);
    }

    update(['products', 'favorites']);
  }
}
