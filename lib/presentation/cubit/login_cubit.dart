import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sword_task/domain/usecases/login_usecases.dart';
import 'package:sword_task/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  Future submit(String email, String password) async {
    try {
      emit(SubmitInitialState());
      var result = await loginUseCase.submit(email, password);
      result.fold(
        (failure) {
          emit(SubmitErrorState(message: failure.message));
        },
        (data) {
          emit(SubmitSuccessState(loginEntity: data));
        },
      );
    } catch (e) {
      emit(SubmitErrorState(message: e.toString()));
    }
  }
}
