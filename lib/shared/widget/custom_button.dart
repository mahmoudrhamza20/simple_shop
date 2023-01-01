import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({super.key, required this.onTap ,required this.text, required this.isUpperCase}) ;
 final void Function()? onTap;
 final String text;
 final bool isUpperCase ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(0),
        ),
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text(isUpperCase ?text.toUpperCase(): text,style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
