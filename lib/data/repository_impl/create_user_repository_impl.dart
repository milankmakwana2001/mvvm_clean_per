import 'package:mvvm_clean_per/data/data_source/remote_data_source.dart';
import 'package:mvvm_clean_per/data/model/all_users_service.dart';
import 'package:mvvm_clean_per/data/model/create_user_service.dart';
import 'package:mvvm_clean_per/domain/models/create_user_model.dart';
import 'package:mvvm_clean_per/domain/repository/create_user_repository.dart';

class CreateUserRepositoryImpl implements CreateUserRepository {
  final RemoteDataSource remoteDataSource;

  @override
  Future<CreateUserService> createUser(CreateUserModel createUserModel) {
    return remoteDataSource.createUser(createUserModel);
  }

  const CreateUserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<AllUserService> allUser() {
    return remoteDataSource.allUser();
  }
}
