// Mocks generated by Mockito 5.0.17 from annotations
// in renofax/test/features/sync/data/repositories/sync_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:renofax/core/network/network_info.dart' as _i5;
import 'package:renofax/features/sync/data/data_sources/sync_remote_data_source.dart'
    as _i2;
import 'package:renofax/features/sync/domain/entities/user.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [SyncRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSyncRemoteDataSource extends _i1.Mock
    implements _i2.SyncRemoteDataSource {
  MockSyncRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.User>> getUsers() =>
      (super.noSuchMethod(Invocation.method(#getUsers, []),
              returnValue: Future<List<_i4.User>>.value(<_i4.User>[]))
          as _i3.Future<List<_i4.User>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i5.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}