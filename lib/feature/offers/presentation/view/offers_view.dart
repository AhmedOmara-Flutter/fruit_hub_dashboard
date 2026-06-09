import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/offers/presentation/widgets/offers_view_body.dart';

import '../view_model/offer_cubit.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {


  @override
  void initState() {
    context.read<OfferCubit>().getOffers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return OffersViewBody();
  }
}
