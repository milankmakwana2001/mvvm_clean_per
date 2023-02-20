import 'dart:io';
import 'package:mvvm_clean_per/core/app_strings.dart';
import 'package:mvvm_clean_per/data/api_services/network_api_service.dart';
import 'package:mvvm_clean_per/data/model/all_users_service.dart';
import 'package:mvvm_clean_per/data/model/create_user_service.dart';
import 'package:mvvm_clean_per/domain/models/create_user_model.dart';

abstract class RemoteDataSource {
  Future<CreateUserService> createUser(CreateUserModel createUserModel);

  Future<AllUserService> allUser();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkApiService apiService;

  RemoteDataSourceImpl({required this.apiService,});



  @override
  Future<CreateUserService> createUser(CreateUserModel createUserModel) async {
    final data = {
      'name': createUserModel.name,
      'job': createUserModel.job,
    };
    try {
      final response = await apiService.callPostApiResponse(
        AppStrings.createUserEndPoint,
        data,
      );
      // log(response.runtimeType.toString());
      return CreateUserService.fromJson(response);
    } on SocketException {
      throw Exception('No internet from RemoteDataSource in createUser');
    } catch (e) {
      throw Exception('${e.toString()} from RemoteDataSource in createUser');
    }
  }

  @override
  Future<AllUserService> allUser() async {
    try {
      final response = await apiService.callGetApiResponse(
        AppStrings.getAllUserEndPoint,
      );
      return AllUserService.fromJson(response);
    } on SocketException {
      throw Exception('No internet from RemoteDataSource in allUser');
    } catch (e) {
      throw Exception('${e.toString()} from RemoteDataSource in allUser');
    }
  }


}
