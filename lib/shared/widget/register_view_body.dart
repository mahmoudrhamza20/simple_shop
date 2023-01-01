

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubits/register_cubit/register_cubit.dart';
import 'package:shop/shared/widget/show_toast.dart';

import '../../views/home_view.dart';
import '../componantes/componantes.dart';
import '../componantes/constsants.dart';
import '../network/local/cache_helper.dart';
import 'custom_button.dart';
import 'custom_text_form.dart';

class RegisterViewBody extends StatelessWidget {
   RegisterViewBody({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSucsses){
          if(state.model.status!){
            //Navigate to home screen => true
            CacheHelper.saveData(key: 'token', value: state.model.data!.token!).then((value) {
              token = state.model.data!.token! ;
              navigateAndFinish(context,const HomeView());
            });
          }else{
            showToast(text: state.model.message!,state: ToastStates.ERROR);
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
                      'REGISTER',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Register now to browse hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      labelText: 'User Name',
                      prefix: Icons.person,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
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
                          RegisterCubit.get(context).userRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                          );
                        }
                      },
                      isPassword: RegisterCubit.get(context).isPasswordShown,
                      prefix: Icons.lock,
                      suffix: RegisterCubit.get(context).suffix,
                      suffixPressed: (){
                        RegisterCubit.get(context).changePasswordVisibility();
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
                    CustomTextFormField(
                      controller: phoneController,
                      labelText: 'Phone',
                      prefix: Icons.phone,
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your phone';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisterLoading,
                      builder: (context) => CustomButton(
                        text: 'register',
                        isUpperCase: true,
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            RegisterCubit.get(context).userRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
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