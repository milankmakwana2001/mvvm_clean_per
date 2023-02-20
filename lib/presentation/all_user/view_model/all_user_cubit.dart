import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_clean_per/data/model/all_users_service.dart';
import 'package:mvvm_clean_per/domain/usecases/all_user_usecase.dart';

part 'all_user_state.dart';

class AllUserCubit extends Cubit<AllUserState> {
  AllUserUseCase useCase;

  AllUserCubit({
    required this.useCase,
  }) : super(AllUserInitial());

  void allUser() async {
    emit(Loading());
    try {
      AllUserService response = await useCase.call();
      emit(
        Success(
          allUserService: response,
        ),
      );
    } on SocketException {
      emit(Error());
      throw Exception('No internet from AllUserCubit in allUser');
    } catch (e) {
      emit(Error());
      throw Exception('${e.toString()} from AllUserCubit in allUser');
    }
  }
}
