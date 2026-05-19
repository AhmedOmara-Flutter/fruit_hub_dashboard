
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/view/add_product_view.dart';
import 'package:fruit_hub_dashboard/feature/main/presentation/view/main_view.dart';
import 'package:fruit_hub_dashboard/feature/splash/view/splash_view.dart';

class RouteManager {
  static const String splash = '/splashView';
  static const String main = '/mainView';
  static const String addProductView = '/addProductView';

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
