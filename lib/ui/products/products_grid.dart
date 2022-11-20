import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_grid_tile.dart';
import 'products_manager.dart';
import 'package:provider/provider.dart';
class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  const ProductsGrid(this.showFavorites, {
    super.key
  });

  Widget build(BuildContext context) {
    // final productsManager = ProductsManager();
    // final products =
    // showFavorites ? productsManager.favoriteItems : productsManager.items;


    // Đọc ra danh sách các product sẽ được hiển thị từ ProductsManager
    final products = context.select<ProductsManager, List<Product>>(
    //       (productsManager) =>
    //   showFavorites ? productsManager.favoriteItems : productsManager.items,
    // );
            (productsManager) => showFavorites
            ? productsManager.favoriteItems
            : productsManager.items);

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 6 / 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
    );
  }
}
