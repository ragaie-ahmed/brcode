abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoadingLogIn extends LoginState {}
class SuccessChange extends LoginState {}
class SuccessLogIn extends LoginState {}
class ErrorLogIn extends LoginState {
   String error;

  ErrorLogIn({required this.error});
}
