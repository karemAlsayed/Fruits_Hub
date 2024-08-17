
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.textInputType, this.suffix, this.onsaved});

  final String hintText;

  final TextInputType textInputType ;

  final Widget? suffix;

  final void Function(String?)? onsaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration:  InputDecoration(
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        hintText: hintText,
        hintStyle: TextStyles.bold13 .copyWith(color: const Color(0xFF949D9E),),
      ),  
    );
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFE6E9E9),
            ),
      );
  }
}