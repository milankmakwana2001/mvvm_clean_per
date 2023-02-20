import 'package:mvvm_clean_per/domain/models/create_user_model.dart';
import 'package:mvvm_clean_per/domain/repository/create_user_repository.dart';

class CreateUserUseCase {
  final CreateUserRepository createUserRepository;

  CreateUserUseCase({
    required this.createUserRepository,
  });

  Future<dynamic> call(CreateUserModel createUserModel) async {
    return createUserRepository.createUser(createUserModel);
  }
}
