import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/login_model.dart';
import 'package:shop/shared/network/end_points.dart';

import '../../network/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  late LoginModel registerModel ;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(RegisterLoading());
    DioHelper.postData(url: kRegister, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    }).then((value) {
      registerModel = LoginModel.fromJson(value.data);
      emit(RegisterSucsses(registerModel));
    }).catchError((error){
      debugPrint(error.toString());
      emit(RegisterError(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_off;
  bool isPasswordShown= true;
  void changePasswordVisibility (){
    isPasswordShown = !isPasswordShown ;
    suffix = isPasswordShown ? Icons.visibility_off : Icons.visibility;
    emit(ChangeRegisterPasswordVisibility());
  }
}
