import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import './domain/repositories/user_repository.dart';
import './data/network/network_status.dart';
import './data/repositories/user_repository_impl.dart';
import './data/api/repositories/remote_user_repository.dart';
import './domain/usecases/get_home_use_case.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImpl(DataConnectionChecker()));

  //get home page products use case
  sl.registerLazySingleton<GetHomePageUseCase>(() => GetHomePageUseCaseImpl());

  //Singleton for HTTP request
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<RemoteUserRepository>(
    () => RemoteUserRepository(),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteUserRepository: sl()),
  );
}
