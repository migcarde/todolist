import 'package:dartz/dartz.dart';
import 'package:data/network_manager.dart';
import 'package:data/operations/item/item_remote_data_source.dart';
import 'package:data/respository_failure.dart';
import 'package:domain/operations/item/item_business.dart';
import 'package:domain/operations/item/item_failure.dart';
import 'package:domain/operations/item/item_repository.dart';
import 'item_response.dart';

class ItemRepositoryImpl extends ItemRepository {
  late final ItemRemoteDataSource dataSource;
  late final NetworkManager networkManager;

  ItemRepositoryImpl({required this.dataSource, required this.networkManager});

  @override
  Future<Either<ItemFailure, List<ItemBusiness>>> getItems() async {
    try {
      if (await networkManager.hasInternetConnection) {
        final items = await dataSource.getItems();

        final result = items.map((response) => response.toDomain()).toList();

        return Right(result);
      } else {
        throw NoInternet();
      }
    } on RepositoryFailure catch (failure) {
      return Left(ItemRepositoryFailure(failure: failure));
    } catch (e) {
      return Left(GetItemsError());
    }
  }
}
