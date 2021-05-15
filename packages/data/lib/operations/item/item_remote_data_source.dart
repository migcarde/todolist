import 'package:data/operations/item/item_response.dart';

import 'item_service.dart';

class ItemRemoteDataSource {
  late final ItemService itemService;

  ItemRemoteDataSource({required this.itemService});

  Future<List<ItemResponse>> getItems() async {
    final response = await itemService.getItems();

    return response.map((json) => ItemResponse.fromJson(json)).toList();
  }
}
