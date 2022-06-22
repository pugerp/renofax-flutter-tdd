import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/features/complainant/data/models/complaint.dart';
import 'package:renofax/features/complainant/domain/usecases/get_complaint_by_id.dart';
import 'package:renofax/features/complainant/domain/usecases/get_complaints.dart';
import 'package:renofax/features/complainant/presentation/bloc/complaint_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'complaint_bloc_test.mocks.dart';

@GenerateMocks([GetComplaints, GetComplaintById])
void main() {
  late ComplaintBloc bloc;
  late MockGetComplaints mockGetComplaints;
  late MockGetComplaintById mockGetComplaintById;

  setUp(() {
    mockGetComplaints = MockGetComplaints();
    mockGetComplaintById = MockGetComplaintById();
    bloc = ComplaintBloc(
        getComplaints: mockGetComplaints,
        getComplaintById: mockGetComplaintById);
  });

  group(('GetComplaints'), () {
    final tComplaints = List<Complaint>.from(json
        .decode(fixture('complaints.json'))
        .map((c) => Complaint.fromJson(c)));

    test('should emit [Loading, Success] when get complaints is success', () async* {
      when(mockGetComplaints(any)).thenAnswer((_) async => Right(tComplaints));

      final expected = {
        Initial(),
        Loading(),
        Success(complaints: tComplaints)
      };

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(fetchComplaint());
    });

    test('should emit [Loading, Error] when get complaints is failed', () async* {
      when(mockGetComplaints(any)).thenAnswer((_) async => Left(ServerFailure()));

      final expected = {
        Initial(),
        Loading(),
        Error(message: 'Failed fetching Complaints'),
      };

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(fetchComplaint());
    });
  });

  group('GetComplaintById', () {
    final tComplaint = Complaint.fromJson(json.decode(fixture('complaint.json')));

    test('should emit [Loading, Success] when get complaint is success', () async* {
      when(mockGetComplaintById(any)).thenAnswer((_) async => Right(tComplaint));

      final expected = {
        Initial(),
        Loading(),
        SuccessById(complaint: tComplaint)
      };

      expectLater(bloc, expected);
      bloc.add(fetchComplaintById(id: 1));
    });

    test('should emit [Loading, Error] when get complaint is failed', () async* {
      when(mockGetComplaintById(any)).thenAnswer((_) async => Left(ServerFailure()));

      final expected = {
        Initial(),
        Loading(),
        Error(message: 'Failed fetching Compalint by ID')
      };

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(fetchComplaintById(id: 1));
    });
  });
}
