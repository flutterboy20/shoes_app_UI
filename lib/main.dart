import 'package:flutter/material.dart';
import 'package:shoes_app_ui_design_1/detail-product-screen.dart';
import 'package:shoes_app_ui_design_1/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      home: BottomNav(),
      debugShowCheckedModeBanner: false,
      routes: {
        DetailProduct.routeName: (ctx) => DetailProduct(),
        BottomNav.routeName: (ctx) => BottomNav(),
      },
    );
  }
}
