import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_clean_per/data/model/create_user_service.dart';
import 'package:mvvm_clean_per/domain/models/create_user_model.dart';
import 'package:mvvm_clean_per/domain/usecases/create_user_usercase.dart';


part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final CreateUserUseCase useCase;

  CreateUserCubit({
    required this.useCase,
  }) : super(CreateUserInitial());

  void createUser(CreateUserModel createUserModel) async {
    emit(Loading());
    try {
      CreateUserService response = await useCase.call(createUserModel);
      log(response.runtimeType.toString());
      emit(
        Success(
          createUserService: response,
        ),
      );
    } on SocketException {
      emit(Error());
      throw Exception('No internet from CreateUserCubit in createUser');
    } catch (e) {
      emit(Error());
      throw Exception('${e.toString()} from CreateUserCubit in createUser');
    }
  }
}
