import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sword_task/domain/usecases/user_list_usecases.dart';
import 'package:sword_task/presentation/cubit/user_list_state.dart';

import '../../domain/entities/user_list_entity.dart';

class UserListCubit extends Cubit<UserState> {
  UserListUseCases userListUseCases;
  List<DatumEntity> usersToEmit = [];

  UserListCubit({required this.userListUseCases}) : super(UserInitialState());

  Future<void> getUserList(String page) async {
    final int requestedPage = int.parse(page);
    final bool isPaginating = requestedPage > 1;

    emit(GetUserListInitialState(isPaginating: isPaginating));

    try {
      var result = await userListUseCases.getUserList(page);

      result.fold(
        (failure) {
          if (isPaginating && state is GetUserListSuccessState) {
            final currentState = state as GetUserListSuccessState;
            emit(
              GetUserListSuccessState(
                accumulatedUsers: currentState.accumulatedUsers,
                currentPage: currentState.currentPage,
                totalPages: currentState.totalPages,
              ),
            );
          } else {
            emit(GetUserListErrorState(message: failure.message));
          }
        },
        (newUserListEntity) {
          final UserListEntity data = newUserListEntity;
          final List<DatumEntity> newUsers = data.data;

          if (isPaginating && state is GetUserListSuccessState) {
            final currentState = state as GetUserListSuccessState;
            usersToEmit.addAll(currentState.accumulatedUsers);
          }

          usersToEmit.addAll(newUsers);

          final newState = GetUserListSuccessState(accumulatedUsers: usersToEmit, currentPage: data.page, totalPages: data.totalPages);
          print('length');
          print(usersToEmit.length);
          emit.call(newState);
        },
      );
    } catch (e) {
      emit(GetUserListErrorState(message: e.toString()));
    }
  }
}
