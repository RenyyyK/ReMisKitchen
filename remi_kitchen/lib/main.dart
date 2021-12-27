import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';

import 'package:remi_kitchen/home_page.dart';
import 'package:remi_kitchen/providers/auth.dart';

void main() => runApp(RemisKitchen());

class RemisKitchen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'RemisKitchen',
          home: auth.isAuth ? HomePage() : AuthScreen(),
          routes: {
            // ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            // CartScreen.routeName: (ctx) => CartScreen(),
            // OrdersScreen.routeName: (ctx) => OrdersScreen(),
            // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            // EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        )
      )
    );
    
  }
}
