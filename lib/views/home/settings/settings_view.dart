import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubits/home_cubit/home_cubit.dart';
import 'package:shop/shared/widget/custom_button.dart';
import '../../../shared/componantes/componantes.dart';
import '../../../shared/widget/custom_text_form.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = HomeCubit.get(context).userModel!.data!.name!;
        emailController.text = HomeCubit.get(context).userModel!.data!.email! ;
        phoneController.text = HomeCubit.get(context).userModel!.data!.phone! ;
        return ConditionalBuilder(
            condition:HomeCubit.get(context).userModel != null ,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:formKey ,
                child: Column(
                  children: [
                    if(state is UpdateUserDataLoading)
                   const LinearProgressIndicator(),
                   const SizedBox(height: 20,),
                    CustomTextFormField(
                      controller: nameController,
                      labelText: 'Name',
                      prefix: Icons.person,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'name must not b empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
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
                      controller: phoneController,
                      labelText: 'Phone',
                      prefix: Icons.phone,
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'phone must not b empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        onTap: (){
                        if(formKey.currentState!.validate()){
                          HomeCubit.get(context).updateUserData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                          );
                        }
                        },
                        text: 'update',
                        isUpperCase: true),
                        const SizedBox(
                      height: 20,
                    ),
                     CustomButton(
                        onTap: (){
                          signOut(context);
                        },
                        text: 'sign out',
                        isUpperCase: true),
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
