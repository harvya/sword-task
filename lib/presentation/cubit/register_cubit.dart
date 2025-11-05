import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sword_task/domain/usecases/register_usecases.dart';
import 'package:sword_task/presentation/cubit/register_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserUseCase registerUserUseCase;

  RegisterUserCubit({required this.registerUserUseCase}) : super(RegisterUserInitialState());

  Future registerUser(String email, String password) async {
    try {
      emit(CreateUserInitialState());
      var result = await registerUserUseCase.registerUser(email, password);
      result.fold(
        (failure) {
          emit(CreateUserErrorState(message: failure.message));
        },
        (data) {
          emit(CreateUserSuccessState(registerEntity: data));
        },
      );
    } catch (e) {
      emit(CreateUserErrorState(message: e.toString()));
    }
  }
}
