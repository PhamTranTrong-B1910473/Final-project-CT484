import '../../models/auth_token.dart';
import '../../models/product.dart';
import 'package:flutter/foundation.dart';

import '../../services/products_service.dart';
//class ProductsManager {
  class ProductsManager with ChangeNotifier {
    //final List<Product> _items = [
    //   Product(
    //     id: 'p1',
    //     title: 'Combo Pizza',
    //     description: 'Mua 1 Pizza size M/L, tặng 1 Pizza (Đế Dày/Mỏng) dòng Classic cùng cỡ.',
    //
    //     price: 29.99,
    //     imageUrl:
    //     'https://thepizzacompany.vn/images/thumbs/000/0003222_combo-chat-qua-219k_500.png',
    //     isFavorite: true,
    //   ),
    //   Product(
    //     id: 'p2',
    //     title: 'Trousers',
    //     description: 'A nice pair of trousers.',
    //     price: 59.99,
    //     imageUrl:
    //     'https://www.thepizzacompany.vn/images/thumbs/000/0003228_an-ngon-suong-suong-cg_300.png',
    //   ),
    //   Product(
    //     id: 'p3',
    //     title: 'Yellow Scarf',
    //     description: 'Warm and cozy - exactly what you need for the winter.',
    //     price: 19.99,
    //     imageUrl:
    //     'https://www.thepizzacompany.vn/images/thumbs/000/0003228_an-ngon-suong-suong-cg_300.png',
    //   ),
    //   Product(
    //     id: 'p4',
    //     title: 'A Pan',
    //     description: 'Prepare any meal you want.',
    //     price: 49.99,
    //     imageUrl:
    //     'https://www.thepizzacompany.vn/images/thumbs/000/0003228_an-ngon-suong-suong-cg_300.png',
    //     isFavorite: true,
    //   ),
    // ];
    List<Product> _items = [];

    final ProductsService _productsService;

    ProductsManager([AuthToken? authToken])
        : _productsService = ProductsService(authToken);

    set authToken(AuthToken? authToken) {
      _productsService.authToken = authToken;
    }

    Future<void> fetchProducts([bool filterByUser = false]) async {
      _items = await _productsService.fetchProducts(filterByUser);
      notifyListeners();
    }

    Future<void> addProduct(Product product) async {
      final newProduct = await _productsService.addProduct(product);
      if (newProduct != null) {
        _items.add(newProduct);
        notifyListeners();
      }
    }

    int get itemCount {
      return _items.length;
    }

    List<Product> get items {
      return [..._items];
    }

    List<Product> get favoriteItems {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }

    Product findById(String id) {
      return _items.firstWhere((prod) => prod.id == id);
    }

    void updateProduct(Product product) {
      final index = _items.indexWhere((item) => item.id == product.id);
      if (index >= 0) {
        _items[index] = product;
        notifyListeners();
      }
    }

    // void toggleFavoriteStatus(Product product) {
    //   final savedStatus = product.isFavorite;
    //   product.isFavorite = !savedStatus;
    // }
    Future<void> toggleFavoriteStatus(Product product) async {
      final savedStatus = product.isFavorite;
      product.isFavorite = !savedStatus;
      if (!await _productsService.saveFavoriteStatus(product)) {
        product.isFavorite = savedStatus;
      }
    }
    void deleteProduct(String id) {
      final index = _items.indexWhere((item) => item.id == id);
      _items.removeAt(index);
      notifyListeners();
    }
  }