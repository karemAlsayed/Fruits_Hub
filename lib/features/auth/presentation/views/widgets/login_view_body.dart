import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/core/widgets/pass_field.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_devider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_loin_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
   AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                height: 44,
              ),
               CustomTextFormField(
                onsaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
               PasswordField(
                onsaved: (value) {
                  password = value!;

                  
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Text('نسيت كلمة المرور؟',
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      )),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(text: 'تسجيل دخول', onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SigninCubit>().signin( email,  password, );
                }else{
                  autoValidateMode = AutovalidateMode.always;
                }
              }),
              const SizedBox(
                height: 43,
              ),
               Center(
                child: DontHaveAccountWidget(
                  onTap: () {
                     
                  Navigator.of(context).pushNamed(SignUpView.routeName);
                
          
                  },
                  title1: 'ليس لديك حساب؟ ',
                  title2: 'انشاء حساب',
                ),
              ),
              const SizedBox(height: 33,),
              const OrDevider(),
              const SizedBox(height: 50,),
              SocialLoginButton(
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {
                  context.read<SigninCubit>().signinWithGoogle();
                },
              ),
              const SizedBox(height: 16,),
              
          

            ],
          ),
        ),
      ),
    );
  }
}


