import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';
import '../../entities/offer_entity.dart';
import '../../repos/offer_repo/offer_repo.dart';
part 'offers_state.dart';

class OffersCubit extends Cubit<OfferState> {
  OffersCubit(this._offerRepo, this._productsRepo) : super(OffersInitial());
  final OfferRepo _offerRepo;
  final ProductRepo _productsRepo;
  List<OfferEntity> offers = [];
  StreamSubscription? _offersSubscription;

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
      },
    );
  }

  void getOffers() {
    emit(GetOffersLoading());
    _offersSubscription = _offerRepo.getOffers().listen((data) {
      data.fold(
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
    });
  }

  Future<void> deleteOffer(OfferEntity offer) async {
    emit(DeleteOfferLoading());

    final result = await _offerRepo.deleteOffer(offer.id);

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
      },
    );
  }

  void resetState() {
    emit(OffersInitial());
  }

  @override
  Future<void> close() {
    _offersSubscription?.cancel();
    return super.close();
  }
}
