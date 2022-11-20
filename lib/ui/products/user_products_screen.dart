
import 'edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/app_drawer.dart';
import 'edit_product_screen.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products'; //dat ten trang
  const UserProductsScreen({super.key});
  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts(true);
  }
  @override
  Widget build(BuildContext context) {
    //final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          //buildAddButton(),
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),//dieu huong giua cac trang
    //   body: RefreshIndicator(
    //     //child: buildUserProductListView(productsManager),
    //     child: buildUserProductListView(),
    //     onRefresh: () async => print('refresh products'),
    //   ),
    // );
  //}
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: buildUserProductListView(),
          );
        },
      ),
    );
  }

  //Widget buildUserProductListView(ProductsManager productsManager) {
    Widget buildUserProductListView() {
    // return ListView.builder(
    //   itemCount: productsManager.itemCount,
    //   itemBuilder: (ctx, i) => Column(
    //     children: [
    //       UserProductListTile(
    //         productsManager.items[i],
    //       ),
    //       const Divider(),
    //     ],
    //   ),
    // );
    return Consumer<ProductsManager>(
      builder: (ctx, productsManager, child) {
        return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              //UserProductListTile(productsManager.items[i]),
              UserProductListTile(
                productsManager.items[i],
              ),
              const Divider(),
            ],
          ),

        );
      },
    );
  }

  // Widget buildAddButton() {
  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      // onPressed: () {
      //   print('Go to edit product screen');
      // },
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
    );
  }
}