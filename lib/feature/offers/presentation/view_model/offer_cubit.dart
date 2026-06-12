import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/offer_entity.dart';
import '../../domain/repos/offer_repo.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit(this._offerRepo, this._productsRepo) : super(OffersInitial());
  final OfferRepo _offerRepo;
  final ProductRepo _productsRepo;
  List<OfferEntity> offers = [];

  Future<void> addOffer(OfferEntity offer) async {
    emit(OffersLoading());
    final result = await _offerRepo.addOffer(offer);
    await result.fold(
      (failure) async {
        emit(OffersFailure(failure.errMessage));
      },
      (offerId) async {
        await _productsRepo.updateProductField(
          productId: offer.productId,
          data: {
            'offerId': offerId,
          },
        );
        print('offerId is $offerId');
       emit(OffersSuccess());
       await getOffers();
      },
    );
  }

  Future<void> getOffers() async {
    emit(GetOffersLoading());
    final result = await _offerRepo.getOffers();
    await result.fold(
      (failure) async {
        emit(GeOffersFailure(failure.errMessage));
      },
      (offers) async {
        this.offers = offers;
        if (offers.isEmpty) {
          emit(GetOffersEmpty());
        } else {
          emit(GeOffersSuccess(offers));
        }
      },
    );
  }

  Future<void> deleteOffer(OfferEntity offer) async {
    emit(DeleteOfferLoading());

    final result = await _offerRepo.deleteOffer(offer.id!);

    await result.fold(
          (failure) async {
        emit(DeleteOfferFailure(failure.errMessage));
      },
          (_) async {

        await _productsRepo.updateProductField(
          productId: offer.productId,
          data: {
            'offerId': null,
          },
        );

        emit(DeleteOfferSuccess());
        await getOffers();
      },
    );
  }

  void resetState() {
    emit(OffersInitial());
  }
}
