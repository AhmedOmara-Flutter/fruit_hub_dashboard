
import 'package:flutter/material.dart';

import '../../feature/add_product/view/add_product_view.dart';

class RouteManager {
  static const String addProductView = '/addProductView';
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.addProductView:
        return MaterialPageRoute(builder: (_) => const AddProductView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text('Something went wrong!')),
        );
      },
    );
  }
}
