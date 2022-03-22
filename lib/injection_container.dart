import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:renofax/core/network/network_info.dart';
import 'package:renofax/features/complainant/data/data_sources/complaint_remote_data_source.dart';
import 'package:renofax/features/complainant/data/repositories/complaint_repository_impl.dart';
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart';
import 'package:renofax/features/complainant/domain/usecases/get_complaint_by_id.dart';
import 'package:renofax/features/complainant/domain/usecases/get_complaints.dart';
import 'package:renofax/features/complainant/presentation/bloc/complaint_bloc.dart';
import 'package:renofax/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:renofax/features/login/data/repositories/login_repository_impl.dart';
import 'package:renofax/features/login/domain/repositories/login_repository.dart';
import 'package:renofax/features/login/domain/usecases/get_token_access_and_refresh.dart';
import 'package:renofax/features/login/presentation/bloc/login_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // register features
  sl.registerFactory(() => LoginBloc(getTokenAccessAndRefresh: sl()));

  sl.registerFactory(
    () => ComplaintBloc(
      getComplaints: sl(),
      getComplaintById: sl(),
    ),
  );

  // register usecases
  sl.registerLazySingleton(() => GetTokenAccessAndRefresh(repository: sl()));
  sl.registerLazySingleton(() => GetComplaints(repository: sl()));
  sl.registerLazySingleton(() => GetComplaintById(repository: sl()));

  // register repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        loginRemote: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<ComplaintRepository>(() => ComplaintRepositoryImpl(
        complaintRemote: sl(),
        networkInfo: sl(),
      ));

  // register datasource
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<ComplaintRemoteDataSource>(
      () => ComplaintRemoteDataSourceImpl(
            client: sl(),
            sharedPreferences: sl(),
          ));

  // register core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // register external
  final sp = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => sp);
}
