import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.isClickable = true,
      required this.controller,
      required this.labelText,
      required this.prefix,
      this.validator,
      required this.inputType,
      this.suffix,
      this.suffixPressed,
      this.onTap,
      this.onChange,
      this.isPassword = false,
      this.onSubmitted})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final IconData prefix;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool isPassword;

  final IconData? suffix;
  final void Function()? suffixPressed;
  final void Function()? onTap;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ))
            : null,
      ),
      validator: validator,
      onTap: onTap,
      onChanged: onChange,
      enabled: isClickable,
    );
  }
}
