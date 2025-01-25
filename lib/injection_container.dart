import 'package:chat_app/core/network/device_internet_connection.dart';
import 'package:chat_app/features/auth/data/data_sources/remote_data_source.dart';
import 'package:chat_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chat_app/features/auth/domain/reopository/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:chat_app/features/auth/domain/usecases/register_new_user_usecase.dart';
import 'package:chat_app/features/auth/presentation/bussiness_logic/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // bloc
  sl.registerFactory(() => AuthBloc(register: sl(), login: sl()));
  // use cases
  sl.registerLazySingleton(() => RegisterNewUserUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => LoginUsecase(authRepo: sl()));
  // repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(connection: sl(), remoteDataSource: sl()));
  // network
  sl.registerLazySingleton<DeviceInternetConnection>(
      () => DeviceInternetConnectionImp(internet: sl()));
  // data sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(auth: sl()));
  // external packages
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
