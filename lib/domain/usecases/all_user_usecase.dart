import 'package:mvvm_clean_per/domain/repository/create_user_repository.dart';

class AllUserUseCase{
  final CreateUserRepository createUserRepository;

  AllUserUseCase({
    required this.createUserRepository,
  });

  Future<dynamic> call() async {
    return createUserRepository.allUser();
  }
}