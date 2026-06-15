import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/offers/presentation/widgets/offers_view_body.dart';

import '../../../../core/helper_function/custom_show_snake_bar.dart';
import '../view_model/offers_cubit.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {


  @override
  void initState() {
    context.read<OffersCubit>().getOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OffersCubit, OfferState>(
        listener: (context, state) {
          if (state is DeleteOfferSuccess) {
            Navigator.pop(context);
          }

          if (state is DeleteOfferFailure) {
            Navigator.pop(context);
            customShowSnakeBar(context, color: Colors.red, label: state.message);
          }
        },
      child: OffersViewBody(),
    );
  }
}
