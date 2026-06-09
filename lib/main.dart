import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/core/utils/theme_manager.dart';
import 'package:fruit_hub_dashboard/feature/offers/presentation/view_model/offer_cubit.dart';
import 'package:fruit_hub_dashboard/feature/reviews/presentation/view_model/get_reviews/get_reviews_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/repos/orders_repo/orders_repo.dart';
import 'core/repos/product_repo/product_repo_impl.dart';
import 'core/utils/route_manager.dart';
import 'feature/admin/presentation/view_model/admin_cubit.dart';
import 'feature/clients/data/repos/clients_repo_impl.dart';
import 'feature/clients/presentation/view_model/clients_cubit.dart';
import 'feature/main/presentation/view_model/main_cubit.dart';
import 'feature/my_products/data/repos/my_product_repo_impl.dart';
import 'feature/my_products/presentation/view_model/my_products_cubit.dart';
import 'feature/offers/data/repos/offer_repo_impl.dart';
import 'feature/reviews/data/repos/review_repo_impl.dart';
import 'feature/reviews/presentation/view_model/get_products_with_review/get_product_with_reviews_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: 'https://wplubouwksawibitfhlj.supabase.co',
    anonKey: 'sb_publishable_28OdrvHF22OZhJIOnmQGFQ_T98mgadn',
  );

  runApp(const MyApp());
}

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
            AdminCubit(
              ProductRepoImpl(FirestoreDatabase()),
              OrdersRepoImpl(FirestoreDatabase()),
            ),),
        BlocProvider(create: (context) =>
            GetProductWithReviewsCubit(ReviewRepoImpl(FirestoreDatabase()))),
        BlocProvider(create: (context) =>
            GetReviewsCubit(ReviewRepoImpl(FirestoreDatabase()))),
        BlocProvider( create: (context) =>
            MyProductsCubit(MyProductRepoImpl(FirestoreDatabase()),
                ProductRepoImpl(FirestoreDatabase())),),

        BlocProvider(create: (context) =>
            OfferCubit(
              OfferRepoImpl(FirestoreDatabase()),
            )),


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
