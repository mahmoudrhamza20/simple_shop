import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubits/login_cubit/login_cubit.dart';
import '../shared/widget/login_view_body.dart';

class ShopLoginView extends StatelessWidget {
  ShopLoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
        ),
        body: LoginViewBody(
            emailController: emailController,
            passwordController: passwordController
        ),
      ),
    );
  }
}


