// Mocks generated by Mockito 5.0.5 from annotations
// in data/test/item_remote_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:data/operations/item/item_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ItemService].
///
/// See the documentation for Mockito's code generation for more information.
class MockItemService extends _i1.Mock implements _i2.ItemService {
  MockItemService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<dynamic>> getItems() =>
      (super.noSuchMethod(Invocation.method(#getItems, []),
              returnValue: Future<List<dynamic>>.value(<dynamic>[]))
          as _i3.Future<List<dynamic>>);
}