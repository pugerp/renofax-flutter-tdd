
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/usecases/usecase.dart';
import 'package:renofax/features/complainant/data/models/complaint_test.dart';
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart';
import 'package:renofax/features/complainant/domain/usecases/get_complaints.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_complaints_test.mocks.dart';

@GenerateMocks([ComplaintRepository])
void main() {
  late GetComplaints usecase;
  late MockComplaintRepository mockComplaintRepository;

  final tComplaints = List<ComplaintTest>.from(json
      .decode(fixture('complaints.json'))
      .map((c) => ComplaintTest.fromJson(c)));

  setUp((){
    mockComplaintRepository = MockComplaintRepository();
    usecase = GetComplaints(repository: mockComplaintRepository);
  });

  test('should get Complaint for the Complaint Repository', () async {
    when(mockComplaintRepository.getComplaints()).thenAnswer((_) async => Right(tComplaints));

    final result = await usecase(NoParams());

    expect(result, Right(tComplaints));
    verify(mockComplaintRepository.getComplaints());
    verifyNoMoreInteractions(mockComplaintRepository);
  });
}