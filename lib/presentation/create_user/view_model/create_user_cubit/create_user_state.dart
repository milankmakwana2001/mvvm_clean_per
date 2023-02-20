part of 'create_user_cubit.dart';

 class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CreateUserInitial extends CreateUserState {
  @override
  List<Object> get props => [];
}

class Loading extends CreateUserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Success extends CreateUserState {
  final CreateUserService createUserService;

  @override
  // TODO: implement props
  List<Object?> get props => [createUserService];

  const Success({
    required this.createUserService,
  });
}

class Error extends CreateUserState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
