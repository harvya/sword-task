import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sword_task/presentation/cubit/user_list_cubit.dart';
import 'package:sword_task/presentation/cubit/user_list_state.dart';

import '../widgets/user_tile_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final ScrollController scrollController = ScrollController(keepScrollOffset: true);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserListCubit>(context).getUserList('1');
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    print("hhhhhhhhh");
    final state = context.read<UserListCubit>().state;
    const double scrollThreshold = 200.0;

    if (!scrollController.hasClients) return;

    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.position.pixels;

    if (currentScroll < (maxScroll - scrollThreshold) || state is! GetUserListSuccessState) {
      return;
    }

    if (state.currentPage < state.totalPages) {
      final nextPage = state.currentPage + 1;

      final bool isCurrentlyPaginating =
          context.read<UserListCubit>().state is GetUserListInitialState &&
          (context.read<UserListCubit>().state as GetUserListInitialState).isPaginating;

      if (!isCurrentlyPaginating) {
        context.read<UserListCubit>().getUserList(nextPage.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Dashboard", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
      ),
      body: BlocBuilder<UserListCubit, UserState>(
        builder: (context, state) {
          if (state is GetUserListInitialState) {
            if (!state.isPaginating) {
              return const Center(child: CircularProgressIndicator());
            }
          }

          if (state is GetUserListErrorState) {
            return Center(
              child: Text('Error: ${state.message}', style: const TextStyle(color: Colors.redAccent)),
            );
          }

          if (state is GetUserListSuccessState) {
            final cubitState = context.watch<UserListCubit>().state;
            final users = state.accumulatedUsers;
            final hasMorePages = state.currentPage < state.totalPages;
            print('${state.currentPage}+++${state.totalPages}');
            final bool isPaginating = cubitState is GetUserListInitialState && cubitState.isPaginating;
            return ListView.builder(
              key: const PageStorageKey<String>('UserListScrollKey'),
              controller: scrollController,
              itemCount: users.length + (hasMorePages ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == users.length) {
                  if (isPaginating) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }

                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: UserCardWidget(user: user),
                );
              },
            );
          }

          return const Center(child: Text("Ready to load data."));
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
