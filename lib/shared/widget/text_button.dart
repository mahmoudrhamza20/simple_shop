
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key, required this.title,required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed ;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title.toUpperCase()),
    );
  }
}