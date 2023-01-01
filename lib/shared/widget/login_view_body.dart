import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubits/login_cubit/login_cubit.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
import 'package:shop/shared/widget/text_button.dart';
import 'package:shop/views/home_view.dart';
import '../../views/register_view.dart';
import '../componantes/componantes.dart';
import '../componantes/constsants.dart';
import 'custom_button.dart';
import 'custom_text_form.dart';
import 'show_toast.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucsses){
          if(state.loginModel.status!){
            //Navigate to home screen => true
            CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token!).then((value) {
              token = state.loginModel.data!.token! ;
              navigateAndFinish(context,const HomeView());
            });
          }else{
            showToast(text: state.loginModel.message!,state: ToastStates.ERROR);
            //Still in login screen => false
          }
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login now to browse hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: 'Email Address',
                      prefix: Icons.email,
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: 'Password',
                      onSubmitted: (value){
                        if(formKey.currentState!.validate()){
                          LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      isPassword: LoginCubit.get(context).isPasswordShown,
                      prefix: Icons.lock,
                      suffix: LoginCubit.get(context).suffix,
                      suffixPressed: (){
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                      inputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password is too short';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoading,
                      builder: (context) => CustomButton(
                        text: 'Login',
                        isUpperCase: true,
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        CustomTextButton(
                            title: 'register',
                            onPressed: () {
                              navigateTo(context,  RegisterView());
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
