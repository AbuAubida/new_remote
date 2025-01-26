import 'package:bloc/bloc.dart';

import 'package:chat_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:chat_app/features/auth/domain/usecases/register_new_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/config/get_error_messege_func.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterNewUserUsecase register;
  final LoginUsecase login;
  AuthBloc({required this.register, required this.login})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegitsterUserEvent) {
        emit(LoadingAuthState());
        final failOrSuccess =
            await register(name: event.name,email: event.email,phone: event.phone, password: event.password);
              emit(loginRegisterFunc(failOrSuccess));

      } else if (event is LoginUserEvent) {
        emit(LoadingAuthState());
        final failOrSuccess =
            await login(email: event.email, password: event.password);
      emit(loginRegisterFunc(failOrSuccess)) ;
      }
    });
  }
  AuthState loginRegisterFunc(Either fail) {
    return fail.fold((fail) {
      return ErrorAuthState(message: getErrorMessageFunc(fail));
    }, (user) {
      return SuccessAuthState(message: "Successfull login  to our application");
    });
  }
}
