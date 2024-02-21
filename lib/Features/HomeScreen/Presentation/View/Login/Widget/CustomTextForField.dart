import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.Icons,
    this.validate,
    required this.controller,
    required this.textValidate,
    required this.textInputType,
    required this.hintText,
    this.IconsPrefix,
     this.fun,
   required this.obs
  }) : super(key: key);

  final IconData? Icons;
  final IconData? IconsPrefix;
  final TextEditingController controller;
  final String textValidate;
  final TextInputType textInputType;
  final String hintText;
  final String? Function(String?)? validate;
  void Function()? fun;

  bool obs;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      textAlign: TextAlign.end,
      keyboardType: textInputType,
      controller: controller,
      validator: validate,
      obscureText: obs,
      decoration: InputDecoration(

        contentPadding: EdgeInsets.only(left: 10, bottom: 10, top: 8),
        prefixIcon: InkWell(
            onTap: fun,
            child: Icon(IconsPrefix, color: Colors.blue,)),
        suffixIcon: Icon(Icons),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.blueAccent,
          fontSize: 18,
       // Set text direction for hint text
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
