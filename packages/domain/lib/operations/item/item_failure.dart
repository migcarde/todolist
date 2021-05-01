import 'package:data/respository_failure.dart';

abstract class ItemFailure {
  ItemFailure([List properties = const <dynamic>[]]) : super();
}

class ItemRepositoryFailure extends ItemFailure {
  late final RepositoryFailure failure;

  ItemRepositoryFailure({required this.failure}) : super([failure]);
}

class GetItemsError extends ItemFailure {}
