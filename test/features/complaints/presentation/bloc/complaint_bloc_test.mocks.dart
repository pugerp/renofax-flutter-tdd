// Mocks generated by Mockito 5.0.17 from annotations
// in renofax/test/features/complaints/presentation/bloc/complaint_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:renofax/core/error/failures.dart' as _i6;
import 'package:renofax/core/usecases/usecase.dart' as _i8;
import 'package:renofax/features/complainant/data/models/complaint.dart' as _i7;
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart'
    as _i2;
import 'package:renofax/features/complainant/domain/usecases/get_complaint_by_id.dart'
    as _i9;
import 'package:renofax/features/complainant/domain/usecases/get_complaints.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeComplaintRepository_0 extends _i1.Fake
    implements _i2.ComplaintRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetComplaints].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetComplaints extends _i1.Mock implements _i4.GetComplaints {
  MockGetComplaints() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ComplaintRepository get repository => (super.noSuchMethod(
      Invocation.getter(#repository),
      returnValue: _FakeComplaintRepository_0()) as _i2.ComplaintRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Complaint>>> call(
          _i8.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue:
                  Future<_i3.Either<_i6.Failure, List<_i7.Complaint>>>.value(
                      _FakeEither_1<_i6.Failure, List<_i7.Complaint>>()))
          as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Complaint>>>);
}

/// A class which mocks [GetComplaintById].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetComplaintById extends _i1.Mock implements _i9.GetComplaintById {
  MockGetComplaintById() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ComplaintRepository get repository => (super.noSuchMethod(
      Invocation.getter(#repository),
      returnValue: _FakeComplaintRepository_0()) as _i2.ComplaintRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.Complaint>> call(_i9.Params? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i6.Failure, _i7.Complaint>>.value(
                  _FakeEither_1<_i6.Failure, _i7.Complaint>()))
          as _i5.Future<_i3.Either<_i6.Failure, _i7.Complaint>>);
}