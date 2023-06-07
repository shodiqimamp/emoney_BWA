import 'package:bloc/bloc.dart';
import 'package:emoney_app/models/user_model.dart';
import 'package:emoney_app/services/user_service.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetByUsername) {
        try {
          emit(UserLoading());

          final users = await UserService().getUserByUsername(event.username);

          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }

      if (event is UserGetRecent) {
        try {
          emit(UserLoading());

          final users = await UserService().getRecentUser();

          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
