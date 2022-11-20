// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import '../../models/product.dart';
// import 'product_detail_screen.dart';
//
// class ProductGridTile extends StatelessWidget {
//   const ProductGridTile(
//       this.product, {
//         super.key,
//       });
//   final Product product;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 10
//         ),
//
//         child: Column(children: [
//           Padding(padding: EdgeInsets.symmetric(vertical: 10),
//             child: Container(
//               width: 300,
//               height: 130,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 3,
//                     blurRadius: 10,
//                     offset: Offset(0,3),
//                   )
//                 ]
//               ),
//               child: Row(children: [
//                 InkWell(
//                   onTap: () {
//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(
//                         //     builder: (ctx) => ProductDetailScreen(product),
//                       Navigator.of(context).pushNamed(
//                           ProductDetailScreen.routeName,
//                           arguments: product.id,
//
//                         );
//                       },
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: Image.network(
//                       product.imageUrl,
//                       //fit: BoxFit.cover,
//                       height: 100,
//                       width: 110,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 150,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         product.title,
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       RatingBar.builder(
//                         initialRating: 4,
//                         minRating: 1,
//                         direction: Axis.horizontal,
//                         itemCount: 5,
//                         itemSize: 18,
//                         itemPadding: EdgeInsets.symmetric(horizontal: 4),
//
//                         itemBuilder: (contexr,_) => Icon(
//                           //FontAwesomeIcons.star,
//                           Icons.star,
//                           color:Colors.red,
//                         ),
//                         onRatingUpdate: (index) {},
//
//                       ),
//                       Text(
//                         '\$${product.price}',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.cyan,
//                           fontSize: 20,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.symmetric(vertical: 10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                     //: IconButton(
//                       //leading: IconButton(
//                       Icon(
//                         product.isFavorite ? Icons.favorite : Icons.favorite_border,
//                         color: Colors.deepOrange,
//                           // onPressed: () {
//                           //  print('Toggle a favorite product');
//                           //  },
//                       ),
//                       Icon(
//                          Icons.add_shopping_cart,
//                         color: Colors.deepOrange,
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ],
//               ),
//             ),
//
//           )
//         ],
//         ),
//       ),
//     );
//   }
//
//
//
//   Widget buildGridFooterBar(BuildContext context) {
//     return GridTileBar(
//       backgroundColor: Colors.grey,
//       // leading: IconButton(
//       //   icon: Icon(
//       //     product.isFavorite ? Icons.favorite : Icons.favorite_border,
//       //   ),
//       //   color: Theme.of(context).colorScheme.secondary,
//         // onPressed: () {
//         //   print('Toggle a favorite product');
//           leading: ValueListenableBuilder<bool>(
//           valueListenable: product.isFavoriteListenable,
//           builder: (ctx, isFavorite, child) {
//           return IconButton(
//           icon: Icon(
//           isFavorite ? Icons.favorite : Icons.favorite_border,
//           ),
//           color: Theme.of(context).colorScheme.secondary,
//           onPressed: () {
//           product.isFavorite = !isFavorite;
//           },
//           );
//         },
//       ),
//       title: Text(
//         product.title,
//         textAlign: TextAlign.center,
//         // style: Styl(color: Colors.black,)
//       ),
//       trailing: IconButton(
//         icon: const Icon(
//           Icons.shopping_cart,
//           color: Colors.red,
//         ),
//         onPressed: () {
//           print('Add item to cart');
//         },
//         color: Theme.of(context).colorScheme.secondary,
//       ),
//     );
//   }
//  }
//
//
// // import 'package:flutter/material.dart';
// // import '../../models/product.dart';
// // import 'product_detail_screen.dart';
// //
// // class ProductGridTile extends StatelessWidget {
// //   const ProductGridTile(
// //       this.product, {
// //         super.key,
// //       });
// //   final Product product;
// //   @override
// //   Widget build(BuildContext context) {
// //     return ClipRRect(
// //       borderRadius: BorderRadius.circular(10),
// //       child: GridTile(
// //         footer: buildGridFooterBar(context),
// //         child: GestureDetector(
// //           onTap: () {
// //             Navigator.of(context).push(
// //               MaterialPageRoute(
// //                 builder: (ctx) => ProductDetailScreen(product),
// //               ),
// //             );
// //           },
// //           child: Image.network(
// //             product.imageUrl,
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildGridFooterBar(BuildContext context) {
// //     return GridTileBar(
// //       backgroundColor: Colors.black87,
// //       leading: IconButton(
// //         icon: Icon(
// //           product.isFavorite ? Icons.favorite : Icons.favorite_border,
// //         ),
// //         color: Theme.of(context).colorScheme.secondary,
// //         onPressed: () {
// //           print('Toggle a favorite product');
// //         },
// //       ),
// //       title: Text(
// //         product.title,
// //         textAlign: TextAlign.center,
// //       ),
// //       trailing: IconButton(
// //         icon: const Icon(
// //           Icons.shopping_cart,
// //         ),
// //         onPressed: () {
// //           print('Add item to cart');
// //         },
// //         color: Theme.of(context).colorScheme.secondary,
// //       ),
// //     );
// //   }
// // }
//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../cart/cart_manager.dart';
import 'product_detail_screen.dart';
import 'products_manager.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
      this.product, {
        super.key,
      });
  final Product product;
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(

          border: Border.symmetric (
            vertical: BorderSide (
                width: 4,
                color: Colors.red,
                style: BorderStyle.solid
            ),
            horizontal:  BorderSide (
                width: 4,
                color: Colors.red,
                style: BorderStyle.solid
            ),
          ),
        ),
        child: GridTile(


          footer: buildGridFooterBar(context),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: ValueListenableBuilder<bool>(
        valueListenable: product.isFavoriteListenable,
        builder: (ctx, isFavorite, child) {
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              //product.isFavorite = !isFavorite;
              ctx.read<ProductsManager>().toggleFavoriteStatus(product);
            },
          );
        },
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          //print('Add item to cart');
          final cart = context.read<CartManager>();     //
          cart.addItem(product);                        //
          ScaffoldMessenger.of(context)                 //
            ..hideCurrentSnackBar()                     //
            ..showSnackBar(                             //
              SnackBar(                                 //
                content: const Text(                    //
                  'Item added to cart',                 //
                ),
                duration: const Duration(seconds: 2),   // add item
                action: SnackBarAction(                 //
                  label: 'UNDO',                        //
                  onPressed: () {                       //
                    cart.removeSingleItem(product.id!);//
                  },
                ),
              ),
            );
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
