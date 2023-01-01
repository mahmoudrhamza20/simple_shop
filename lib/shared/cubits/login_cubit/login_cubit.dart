import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/login_model.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';

import '../../network/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel ;

  void userLogin({required String email, required String password,})
  {
    emit(LoginLoading());
    DioHelper.postData(url: kLogin, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSucsses(loginModel));
    }).catchError((error){
      debugPrint(error.toString());
      emit(LoginError(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_off;
  bool isPasswordShown= true;
  void changePasswordVisibility (){
    isPasswordShown = !isPasswordShown ;
    suffix = isPasswordShown ? Icons.visibility_off : Icons.visibility;
    emit(ChangePasswordVisibility());
  }


}
