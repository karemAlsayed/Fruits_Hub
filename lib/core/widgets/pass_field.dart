





import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key, this.onsaved,
  });
  final void Function(String?)? onsaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    
    return CustomTextFormField(
      onsaved: widget.onsaved,
      obsecureText: obsecureText,
      suffix:  IconButton(
        onPressed: () {
          obsecureText = !obsecureText;
          setState(() {});
        },
       icon: Icon(obsecureText ? Icons.visibility_off : Icons.visibility),
        color: const Color(0xFFc9cecf),
        
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
