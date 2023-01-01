part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class RegisterLoading extends RegisterState {}

class RegisterSucsses extends RegisterState {
  final LoginModel model ;
  RegisterSucsses(this.model);
}

class RegisterError extends RegisterState {
  final String error ;
  RegisterError(this.error);
}
class ChangeRegisterPasswordVisibility extends RegisterState {
}
