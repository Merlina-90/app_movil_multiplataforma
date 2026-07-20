import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/product.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = false;

  // 🔹 Cargar todos los productos
  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    products = await DatabaseHelper.instance.getProducts();

    isLoading = false;
    notifyListeners();
  }

  // 🔹 Búsqueda por nombre o descripción
  Future<void> search(String query) async {
    isLoading = true;
    notifyListeners();

    products = await DatabaseHelper.instance.searchProducts(query);

    isLoading = false;
    notifyListeners();
  }

  // 🔹 Filtro por cantidad mínima
  Future<void> filterByQuantity(int minQty) async {
    isLoading = true;
    notifyListeners();

    products = await DatabaseHelper.instance.filterByQuantity(minQty);

    isLoading = false;
    notifyListeners();
  }
}
