import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_condesions_checkbox.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const CustomTextFormField(
              hintText: 'الإسم كاملاً',
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              suffix: Icon(
                Icons.remove_red_eye,
                color: Color(0xFFc9cecf),
              ),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndConditionsWidget(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(text: 'إنشاء حساب جديد', onPressed: () {}),
            const SizedBox(
              height: 26,
            ),
            DontHaveAccountWidget(
              title1: '  لديك حساب بالفعل ؟',
              title2: 'تسجيل دخول',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
