import 'package:appfood8/ui/cart/cart_screen.dart';
// import 'package:appfood8/ui/orders/orders_screen.dart';
// import 'package:appfood8/ui/products/product_detail_screen.dart';
// import 'package:appfood8/ui/products/products_manager.dart';
// import 'package:appfood8/ui/products/user_products_screen.dart';
import 'package:flutter/material.dart';
// import 'ui/products/product_overview_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {

  // load the .env file
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'AppFood',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     fontFamily: 'Lato',
    //     colorScheme: ColorScheme.fromSwatch(
    //       primarySwatch: Colors.red,
    //     ).copyWith(
    //         secondary: Colors.deepOrange
    //     ),
    //
    //   ),
    // home: SafeArea(
    //   // child: ProductDetailScreen(
    //   //   ProductsManager().items[0],
    //   //child: ProductsOverviewScreen(),
    //   //child: UserProductsScreen(),
    //   //child: CartScreen(),
    //   child: OrdersScreen(),
    // khai bao cac trang cua ung dung
    // home: const ProductsOverviewScreen(),
    // routes: {
    //   CartScreen.routeName: (ctx) => const CartScreen(),
    //   OrdersScreen.routeName: (ctx) => const OrdersScreen(),
    //   UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
    // },
    // onGenerateRoute: (settings) {
    //   if (settings.name == ProductDetailScreen.routeName) {
    //     final productId = settings.arguments as String;
    //     return MaterialPageRoute(
    //       builder: (ctx) {
    //         return ProductDetailScreen(
    //           ProductsManager().findById(productId), // duoc dinh nghia trong productmanager.dart
    //         );
    //       },
    //     );
    //   }
    //   return null;
    // },
    return MultiProvider(
      providers: [
        // taoj cung cap doi tuong AuthManager
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => ProductsManager(),
        // ),
        ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
          create: (ctx) => ProductsManager(),
          update: (ctx, authManager, productsManager) {
        // Khi authManager có báo hiệu thay đổi thì đọc lại authToken
      // cho productManager
            productsManager!.authToken = authManager.authToken;
            return productsManager;
          },
        ),
        ChangeNotifierProvider(
          // cung cấp đối tượng CartManager
          create: (ctx) => CartManager(), //cho các widget con truy xuất:
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersManager(),
        ),
      ],
      child: Consumer<AuthManager>(builder: (ctx, authManager, child) {
      return MaterialApp(
        title: 'App Food',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        //home: const ProductsOverviewScreen(),
        home: authManager.isAuth
            ? const ProductsOverviewScreen()
            : FutureBuilder(
          future: authManager.tryAutoLogin(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const SplashScreen()
                : const AuthScreen();
          },
        ),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
          //ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductDetailScreen(
                  ctx.read<ProductsManager>().findById(productId),
                  // ProductsManager().findById(productId));
                );
              },
            );
          }
          if (settings.name == EditProductScreen.routeName) {
            final productId = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (ctx) {
                return EditProductScreen(
                  productId != null
                      ? ctx.read<ProductsManager>().findById(productId)
                      : null,
                );
              },
            );
          }
          return null;
        },
      );
      }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
