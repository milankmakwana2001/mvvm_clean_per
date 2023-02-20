// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:mvvm_clean_per/presentation/all_user/view/all_user_screen.dart';
import 'package:mvvm_clean_per/presentation/all_user/view_model/all_user_cubit.dart';
import 'package:mvvm_clean_per/presentation/create_user/view/create_user_screen.dart';
import 'package:mvvm_clean_per/presentation/create_user/view_model/create_user_cubit/create_user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_conteiner.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<CreateUserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.locator<AllUserCubit>()..allUser(),
        ),
      ],
      child: MaterialApp(
        title: 'mvvm with clean Architecture',
        home: CreateUserScreen(),
        routes: {
          AllUserScreen.pageRoute: (context) => AllUserScreen(),
        },
      ),
    );
  }
}
