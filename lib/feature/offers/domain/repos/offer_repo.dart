import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/feature/offers/domain/entities/offer_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class OfferRepo {
  Future<Either<Failure, void>> addOffer(OfferEntity offer,);

  Future<Either<Failure, List<OfferEntity>>> getOffers();

  Future<Either<Failure, void>> deleteOffer(String offerId,);

  Future<Either<Failure, void>> updateOffer(OfferEntity offer,);
}
