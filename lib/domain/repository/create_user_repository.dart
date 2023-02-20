import 'package:mvvm_clean_per/data/model/all_users_service.dart';
import 'package:mvvm_clean_per/data/model/create_user_service.dart';
import 'package:mvvm_clean_per/domain/models/create_user_model.dart';

abstract class CreateUserRepository{
  Future<CreateUserService> createUser(CreateUserModel createUserModel);
  Future<AllUserService> allUser();
}