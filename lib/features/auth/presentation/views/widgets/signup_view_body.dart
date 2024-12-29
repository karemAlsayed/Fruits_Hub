import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/core/widgets/pass_field.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_condesions_checkbox.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, userName;
  late bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onsaved: (value) {
                  userName = value!;
                },
                hintText: 'الإسم كاملاً',
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onsaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onsaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditionsWidget(
                onTermsAccepted: (value) {
                  termsAccepted = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (termsAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                                email, password, userName);
                      } else {
                        buildErrorBar(context, 'قم بقبول الشروط والاحكام');
                      }
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
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
      ),
    );
  }
}
