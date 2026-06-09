import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/feature/offers/data/models/offer_model.dart';
import 'package:fruit_hub_dashboard/feature/offers/domain/entities/offer_entity.dart';
import 'package:fruit_hub_dashboard/feature/offers/domain/repos/offer_repo.dart';

class OfferRepoImpl implements OfferRepo {
  final DatabaseServices _databaseServices;

  OfferRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, void>> addOffer(OfferEntity offer) async {
    try {
      final result = await _databaseServices.addData(
        path: 'offers',
        data: OffersModel.fromEntity(offer).toJson(),
      );
      return Right(result);
    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOffer(String offerId) {
    // TODO: implement deleteOffer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffers() async {
    try {
      final result =
          await _databaseServices.getData(path: 'offers')
              as List<Map<String, dynamic>>;
      List<OfferEntity> offers = result
          .map((e) => OffersModel.fromJson(e).toEntity())
          .toList();
      return Right(offers);
    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOffer(OfferEntity offer) {
    // TODO: implement updateOffer
    throw UnimplementedError();
  }
}
