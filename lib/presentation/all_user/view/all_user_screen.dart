import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_clean_per/presentation/all_user/view_model/all_user_cubit.dart';

class AllUserScreen extends StatefulWidget {
  static const pageRoute = '/all-user-screen';

  const AllUserScreen({Key? key}) : super(key: key);

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  late final AllUserCubit _allUserCubit;

  @override
  void initState() {
    // TODO: implement initState
    _allUserCubit = context.read<AllUserCubit>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _allUserCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All User',
        ),
      ),
      body: BlocBuilder<AllUserCubit, AllUserState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Success) {
            ('${state.allUserService.data}');
            return ListView.builder(
              itemCount: state.allUserService.data.length ?? 0,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(
                    state.allUserService.data[i].firstName,
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('all-user-screen'),
          );
        },
      ),
    );
  }
}
