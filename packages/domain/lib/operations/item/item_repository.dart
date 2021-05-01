import 'package:dartz/dartz.dart';
import 'package:domain/operations/item/item_business.dart';
import 'package:domain/operations/item/item_failure.dart';

abstract class ItemRepository {
  Future<Either<ItemFailure, List<ItemBusiness>>> getItems();
}
