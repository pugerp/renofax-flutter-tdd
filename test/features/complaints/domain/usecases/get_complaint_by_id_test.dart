import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/features/complainant/data/models/complaint.dart';
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart';
import 'package:renofax/features/complainant/domain/usecases/get_complaint_by_id.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_complaints_test.mocks.dart';

@GenerateMocks([ComplaintRepository])
void main(){
  late GetComplaintById usecase;
  late MockComplaintRepository mockComplaintRepository;

  final tComplaint = Complaint.fromJson(json.decode(fixture('complaint.json')));
  final tComplaintId = 1;

  setUp((){
    mockComplaintRepository = MockComplaintRepository();
    usecase = GetComplaintById(repository: mockComplaintRepository);
  });

  test('should get Complaint with Id for the Complaint Repository', () async {
    when(mockComplaintRepository.getComplaintById(any)).thenAnswer((_) async => Right(tComplaint));

    final result = await usecase(Params(id: tComplaintId));

    expect(result, Right(tComplaint));
    verify(mockComplaintRepository.getComplaintById(tComplaintId));
    verifyNoMoreInteractions(mockComplaintRepository);
  });
}