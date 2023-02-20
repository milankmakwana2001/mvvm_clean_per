import 'package:get_it/get_it.dart';
import 'package:mvvm_clean_per/data/api_services/network_api_service.dart';
import 'package:mvvm_clean_per/data/data_source/remote_data_source.dart';
import 'package:mvvm_clean_per/data/repository_impl/create_user_repository_impl.dart';
import 'package:mvvm_clean_per/domain/repository/create_user_repository.dart';
import 'package:mvvm_clean_per/domain/usecases/all_user_usecase.dart';
import 'package:mvvm_clean_per/domain/usecases/create_user_usercase.dart';
import 'package:mvvm_clean_per/presentation/all_user/view_model/all_user_cubit.dart';
import 'package:mvvm_clean_per/presentation/create_user/view_model/create_user_cubit/create_user_cubit.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

Future<void> init() async {
  //Cubits
  locator.registerFactory(
    () => CreateUserCubit(
      useCase: locator.call(),
    ),
  );

  locator.registerFactory(
    () => AllUserCubit(
      useCase: locator.call(),
    ),
  );

  //UseCases
  locator.registerLazySingleton(
    () => CreateUserUseCase(
      createUserRepository: locator.call(),
    ),
  );
  locator.registerLazySingleton(
    () => AllUserUseCase(
      createUserRepository: locator.call(),
    ),
  );

  //Repository
  locator.registerLazySingleton<CreateUserRepository>(
    () => CreateUserRepositoryImpl(
      remoteDataSource: locator.call(),
    ),
  );

  //DataSource
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      apiService: locator.call(),
    ),
  );


  //Services
  locator.registerLazySingleton(
    () => NetworkApiService(
      client: locator.call(),
    ),
  );


  //External
  locator.registerLazySingleton(
    () => http.Client(),
  );


}
