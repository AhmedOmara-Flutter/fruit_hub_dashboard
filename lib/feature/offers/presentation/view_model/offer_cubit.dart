import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/offer_entity.dart';
import '../../domain/repos/offer_repo.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit(this._offerRepo) : super(OffersInitial());
  final OfferRepo _offerRepo;
  List<OfferEntity> offers = [];

  Future<void> addOffer(OfferEntity offerEntity) async {
    emit(OffersLoading());
    final result = await _offerRepo.addOffer(offerEntity);
    await result.fold(
      (failure) async {
        emit(OffersFailure(failure.errMessage));
      },
      (success) async {
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

  Future<void> deleteOffer(String offerId) async {
    emit(DeleteOfferLoading());
    final result = await _offerRepo.deleteOffer(offerId);
    await result.fold(
      (failure) async {
        emit(DeleteOfferFailure(failure.errMessage));
      },
      (success) async {
        emit(DeleteOfferSuccess());
        await getOffers();
      },
    );
  }

  void resetState() {
    emit(OffersInitial());
  }
}
