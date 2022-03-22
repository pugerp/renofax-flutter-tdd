import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/network/network_info.dart';
import 'package:renofax/features/complainant/data/data_sources/complaint_remote_data_source.dart';
import 'package:renofax/features/complainant/data/models/complaint_test.dart';
import 'package:renofax/features/complainant/data/repositories/complaint_repository_impl.dart';
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'complaint_respository_impl_test.mocks.dart';

@GenerateMocks([ComplaintRemoteDataSource, NetworkInfo])
void main() {
  late ComplaintRepositoryImpl repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockComplaintRemoteDataSource mockComplaintRemoteDataSource;

  final tComplaints = List<ComplaintTest>.from(json
      .decode(fixture('complaints.json'))
      .map((c) => ComplaintTest.fromJson(c)));

  final tComplaint = ComplaintTest.fromJson(json.decode(fixture('complaint.json')));

  final tComplaintId = 1;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockComplaintRemoteDataSource = MockComplaintRemoteDataSource();
    repository = ComplaintRepositoryImpl(
      complaintRemote: mockComplaintRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('device is Online', () {
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    group('GetComplaints', (){
      test('GetComplaints is Success', () async {
        when(mockComplaintRemoteDataSource.getComplaints()).thenAnswer((_) async => tComplaints);

        final result = await repository.getComplaints();

        verify(mockNetworkInfo.isConnected);
        verify(mockComplaintRemoteDataSource.getComplaints());
        expect(result, equals(Right(tComplaints)));
      });

      test('GetComplaints is Failed', () async {
        when(mockComplaintRemoteDataSource.getComplaints()).thenThrow(ServerException());

        final result = await repository.getComplaints();

        verify(mockNetworkInfo.isConnected);
        verify(mockComplaintRemoteDataSource.getComplaints());
        expect(result, equals(Left(ServerFailure())));
      });
    });


    group('GetComplaintById', (){
      test('GetComplaintById is Success', () async {
        when(mockComplaintRemoteDataSource.getComplaintById(any)).thenAnswer((_) async => tComplaint);

        final result = await repository.getComplaintById(tComplaintId);

        verify(mockNetworkInfo.isConnected);
        verify(mockComplaintRemoteDataSource.getComplaintById(tComplaintId));
        expect(result, equals(Right(tComplaint)));
      });

      test('GetComplaintById is Failed', () async {
        when(mockComplaintRemoteDataSource.getComplaintById(any)).thenThrow(ServerException());

        final result = await repository.getComplaintById(tComplaintId);

        verify(mockNetworkInfo.isConnected);
        verify(mockComplaintRemoteDataSource.getComplaintById(tComplaintId));
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });

  group('device is Offline', () {
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('GetComplaints is failed cause no internet connection', () async {

      final result = await repository.getComplaints();

      verify(mockNetworkInfo.isConnected);
      expect(result, equals(Left(ConnectionFailure())));
    });

    test('GetComplaintById is failed cause no internet connection', () async {
      final result = await repository.getComplaintById(tComplaintId);

      verify(mockNetworkInfo.isConnected);
      expect(result, equals(Left(ConnectionFailure())));
    });
  });
}
