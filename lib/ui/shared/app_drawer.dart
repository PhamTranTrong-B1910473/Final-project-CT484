//
// // thuc hien dieu huong ung dung
// import 'package:flutter/material.dart';
//
// import '../orders/orders_screen.dart';
// import '../products/user_products_screen.dart';
//
// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           AppBar(
//             title: const Text('Hello Friend!'),
//             automaticallyImplyLeading: false,
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.shop),
//             title: const Text('Shop'),
//             onTap: () {
//               Navigator.of(context).pushReplacementNamed('/');
//             },
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.payment),
//             title: const Text('Orders'),
//             onTap: () {
//               Navigator.of(context)
//                   .pushReplacementNamed(OrdersScreen.routeName);
//             },
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.edit),
//             title: const Text('Manage Products'),
//             onTap: () {
//               Navigator.of(context)
//                   .pushReplacementNamed(UserProductsScreen.routeName);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



// thuc hien dieu huong ung dung
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../orders/orders_screen.dart';
import '../products/user_products_screen.dart';
import 'package:provider/provider.dart';
import '../auth/auth_manager.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          padding:EdgeInsets.zero ,
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ), accountEmail: null,
            accountName: null,
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.bfbNmLdRBSXVwsUOnlKNsgHaHa?w=195&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7") ,),
          ),


        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.red,
          ),
          title: const Text('Shop',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
             },
        ),
        const Divider(),
        ListTile(
          leading: Icon(
            CupertinoIcons.cart_fill,
            color: Colors.red,
          ),
          title: const Text('My Order',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
        ),
        const Divider(),
        ListTile(
          leading: Icon(
            CupertinoIcons.settings,
            color: Colors.red,
          ),
          title: const Text('Manager Product',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);

          },
        ),
        const Divider(),
        //lien ket dang xuat
        ListTile(
          leading: Icon(
            CupertinoIcons.square_arrow_left,
            color: Colors.red,
          ),
          title: const Text('Log Out',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          onTap: () {
            Navigator.of(context)
              ..pop()
              ..pushReplacementNamed('/');
            context.read<AuthManager>().logout();

          },
        ),
      ],
      ),
    );
  }
}