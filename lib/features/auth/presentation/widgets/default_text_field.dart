import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/themes.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      required this.controller,
      this.onchanged,
      this.onValidate,
      this.keyboardType,
      required this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      
      required this.isPassword, this.onsuffixPressed});
  final TextEditingController controller;
  final Function(String)? onchanged;
  final String? Function(String?)? onValidate;
  final TextInputType? keyboardType;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final Function()?onsuffixPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     
      // autovalidateMode: AutovalidateMode.always,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "$labelText can't be null";
        } else {
          
                    return null;
        }
      },
      onChanged: onchanged,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
       
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Theme.of(context).primaryColor,
              )
            : null,
        suffixIcon: suffixIcon != null ? IconButton(icon: Icon(suffixIcon),onPressed:onsuffixPressed ,) : null,
        
        suffixIconColor: defalutColor,
        enabledBorder: textFieldBorder,
        
        focusedBorder: textFieldBorder.copyWith(
            borderSide: const BorderSide(color: defalutColor, width: 2)),
        errorBorder: textFieldBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: textFieldBorder,
      ),
    );
  }
}
