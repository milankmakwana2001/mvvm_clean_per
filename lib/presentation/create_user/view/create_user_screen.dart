import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_clean_per/domain/models/create_user_model.dart';
import 'package:mvvm_clean_per/presentation/all_user/view/all_user_screen.dart';
import 'package:mvvm_clean_per/presentation/create_user/view_model/create_user_cubit/create_user_cubit.dart';

class CreateUserScreen extends StatefulWidget {
  static const pageRoute = '/create-user-screen';

  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  late CreateUserCubit _createUserCubit;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _middlenameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _jobController.dispose();
    _lastnameController.dispose();
    _middlenameController.dispose();
    _createUserCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _createUserCubit = context.read<CreateUserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create User',
        ),
      ),
      body: Column(
        children: [
          CustomTextfield(
            controller: _nameController,
            lable: 'name',
          ),
          CustomTextfield(
            lable: 'job',
            controller: _jobController,
          ),
          CustomTextfield(
            lable: 'middlename',
            controller: _middlenameController,
          ),
          CustomTextfield(
            lable: 'lastname',
            controller: _lastnameController,
          ),
          ElevatedButton(
            onPressed: () {
              _createUserCubit.createUser(
                CreateUserModel(
                  name: _nameController.text,
                  job: _jobController.text,
                ),
              );
            },
            child: const Text(
              'Get Data',
            ),
          ),
          BlocConsumer<CreateUserCubit, CreateUserState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Success) {
                return Center(
                  child: Text('${state.createUserService.name} is'),
                );
              } else {
                return Container();
              }
            },
            listener: (context, state) {
              if (state is Success) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AllUserScreen.pageRoute, (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }

  Container CustomTextfield({
    required String lable,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.all(
        15,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lable,
        ),
      ),
    );
  }
}
