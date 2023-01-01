part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucsses extends LoginState {
  final LoginModel loginModel ;

  LoginSucsses(this.loginModel);
}

class LoginError extends LoginState {
  final String error ;
  LoginError(this.error);
}
class ChangePasswordVisibility extends LoginState {
}
