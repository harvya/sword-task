import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sword_task/data/datasources/login_datasource.dart';
import 'package:sword_task/data/datasources/register_datasource.dart';
import 'package:sword_task/data/datasources/user_list_datasource.dart';
import 'package:sword_task/data/repositories/login_repo_impl.dart';
import 'package:sword_task/data/repositories/register_repo_impl.dart';
import 'package:sword_task/data/repositories/user_list_repo_impl.dart';
import 'package:sword_task/domain/usecases/login_usecases.dart';
import 'package:sword_task/domain/usecases/register_usecases.dart';
import 'package:sword_task/domain/usecases/user_list_usecases.dart';
import 'package:sword_task/presentation/cubit/login_cubit.dart';
import 'package:sword_task/presentation/cubit/register_cubit.dart';
import 'package:sword_task/presentation/cubit/user_list_cubit.dart';
import 'package:sword_task/presentation/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterUserCubit>(
          create: (context) => RegisterUserCubit(
            registerUserUseCase: RegisterUserUseCase(
              registerUserRepository: RegisterUserRepoImpl(registerUserDataSource: RegisterUserDataSourceImpl()),
            ),
          ),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            loginUseCase: LoginUseCase(loginRepository: LoginRepoImpl(loginDataSource: LoginDataSourceImpl())),
          ),
        ),
        BlocProvider<UserListCubit>(
          create: (context) => UserListCubit(
            userListUseCases: UserListUseCases(userListRepository: UserListRepoImpl(userListDataSource: UserListDataSourceImpl())),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: SplashScreen(),
      ),
    );
  }
}
