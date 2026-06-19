import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/reviews_repo/review_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/core/utils/theme_manager.dart';
import 'package:fruit_hub_dashboard/feature/clients/data/repos/clients_repo_impl.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/view_model/clients_cubit.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/view_model/get_products_with_review/get_product_with_reviews_cubit.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/view_model/get_reviews/get_reviews_cubit.dart';
import '../../feature/main/presentation/view_model/main_cubit.dart';
import '../repos/offer_repo/offer_repo_impl.dart';
import '../../generated/l10n.dart';
import '../cubit/offers_cubit/offers_cubit.dart';
import '../cubit/orders_cubit/orders_cubit.dart';
import '../cubit/products_cubit/products_cubit.dart';
import '../repos/product_repo/product_repo_impl.dart';
import '../utils/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) =>
            ClientsCubit(ClientsRepoImpl(FirestoreDatabase()),
              OrdersRepoImpl(FirestoreDatabase()),
            )),
        BlocProvider(create: (context) =>
            GetProductWithReviewsCubit(ReviewRepoImpl(FirestoreDatabase()))),
        BlocProvider(create: (context) =>
            GetReviewsCubit(ReviewRepoImpl(FirestoreDatabase()))),
        BlocProvider(create: (context) =>
            ProductsCubit(ProductRepoImpl(
              FirestoreDatabase(),
            ))),
        BlocProvider(create: (context) =>
            OffersCubit(OfferRepoImpl(FirestoreDatabase()),
                ProductRepoImpl(FirestoreDatabase()))),
        BlocProvider(create: (context) =>
            OrdersCubit(OrdersRepoImpl(FirestoreDatabase()))),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale('ar'),
        theme: ThemeManager.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: GenerateRoute.generateRoute,
        initialRoute: RouteManager.splash,
      ),
    );
  }
}
