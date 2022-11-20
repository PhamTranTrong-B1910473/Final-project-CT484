

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/product.dart';
import '../shared/app_drawer.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail'; //dat ten trang
  const ProductDetailScreen(
      this.product, {
        super.key,
      });

  final Product product;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Back")),
        
        body:Padding(
          padding: EdgeInsets.only(top: 5),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.all(16),
                child: Image.network(
                  product.imageUrl,
                  //fit: BoxFit.cover,
                  height: 300,
                ),
              ),
              Arc(
                height: 25,
                edge: Edge.TOP,
                arcType: ArcType.CONVEY,

                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4),

                                itemBuilder: (contexr,_) => Icon(
                                  //FontAwesomeIcons.star,
                                  Icons.star,
                                  color:Colors.red,
                                ),
                                onRatingUpdate: (index) {},

                              ),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                product.title,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              Container(

                                width: 90,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      CupertinoIcons.minus,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(fontSize: 16,
                                      color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                )
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10,),
                        child: Text(
                          product.description,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(product.title),
//     ),
//     body: SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 300,
//             width: double.infinity,
//             child: Image.network(
//               product.imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             '\$${product.price}',
//             style: const TextStyle(
//               color: Colors.red,
//               fontSize: 20,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             width: double.infinity,
//             child: Text(
//               product.description,
//               textAlign: TextAlign.center,
//               softWrap: true,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
}