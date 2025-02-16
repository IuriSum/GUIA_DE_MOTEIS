// Mocks generated by Mockito 5.4.5 from annotations
// in guia_de_moteis/test/mocks/mock_api_service.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:guia_de_moteis/data/api/api_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i2.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseUrl =>
      (super.noSuchMethod(
            Invocation.getter(#baseUrl),
            returnValue: _i3.dummyValue<String>(
              this,
              Invocation.getter(#baseUrl),
            ),
          )
          as String);

  @override
  String get secondUrl =>
      (super.noSuchMethod(
            Invocation.getter(#secondUrl),
            returnValue: _i3.dummyValue<String>(
              this,
              Invocation.getter(#secondUrl),
            ),
          )
          as String);

  @override
  _i4.Future<Map<String, dynamic>> fetchData() =>
      (super.noSuchMethod(
            Invocation.method(#fetchData, []),
            returnValue: _i4.Future<Map<String, dynamic>>.value(
              <String, dynamic>{},
            ),
          )
          as _i4.Future<Map<String, dynamic>>);
}
