// Mocks generated by Mockito 5.0.17 from annotations
// in renofax/test/features/complaints/domain/usecases/get_complaints_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:renofax/core/error/failures.dart' as _i5;
import 'package:renofax/features/complainant/data/models/complaint.dart' as _i6;
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ComplaintRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockComplaintRepository extends _i1.Mock
    implements _i3.ComplaintRepository {
  MockComplaintRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Complaint>>> getComplaints() =>
      (super.noSuchMethod(Invocation.method(#getComplaints, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.Complaint>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.Complaint>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Complaint>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Complaint>> getComplaintById(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getComplaintById, [id]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Complaint>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Complaint>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Complaint>>);
}
