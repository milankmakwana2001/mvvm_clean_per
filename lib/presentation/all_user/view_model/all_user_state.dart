part of 'all_user_cubit.dart';

abstract class AllUserState extends Equatable {
  const AllUserState();
}

class AllUserInitial extends AllUserState {
  @override
  List<Object> get props => [];
}

class Loading extends AllUserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Success extends AllUserState{
  final AllUserService allUserService;

  @override
  // TODO: implement props
  List<Object?> get props => [allUserService];

  const Success({
    required this.allUserService,
  });
}

class Error extends AllUserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
