import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/add_product_view.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/view/display_orders_view.dart';
import 'package:fruit_hub_dashboard/feature/main/presentation/view/main_view.dart';
import 'package:fruit_hub_dashboard/feature/splash/view/splash_view.dart';

import '../../feature/edit_product/presentation/view/edit_product_view.dart';
import '../../feature/reviews/presentation/view/product_reviews.dart';
import '../entities/product_entity.dart';

class RouteManager {
  static const String splash = '/splashView';
  static const String main = '/mainView';
  static const String addProductView = '/addProductView';
  static const String displayOrders = '/displayOrdersView';
  static const String productReviews = '/productReviewsView';
  static const String editProductView = '/editProductView';

}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.main:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteManager.addProductView:
        return MaterialPageRoute(builder: (_) => const AddProductView());
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteManager.displayOrders:
        final orders = settings.arguments as List<OrderEntity>;
        return MaterialPageRoute(builder: (_) => DisplayOrdersView(orders: orders,));
      case RouteManager.productReviews:
        final  product= settings.arguments as ProductEntity;;
        return MaterialPageRoute(builder: (_) => ProductReviewsView(product: product,));
        case RouteManager.editProductView:
          final  product= settings.arguments as ProductEntity;;
        return MaterialPageRoute(builder: (_) =>  EditProductView(product: product,));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('حدثت مشكله')),
          body: Center(
              child: Text('حدثت مشكله برجاء اغلاق التطبيق وتشغيله ثانيتا !')),
        );
      },
    );
  }
}
