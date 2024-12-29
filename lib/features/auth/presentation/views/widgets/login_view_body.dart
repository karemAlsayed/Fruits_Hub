import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_devider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_loin_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffix: Icon(
                Icons.remove_red_eye,
                color: Color(0xFFc9cecf),
              ),
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
            CustomButton(text: 'تسجيل دخول', onPressed: () {}),
            const SizedBox(
              height: 33,
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
            const SizedBox(height: 16,),
            SocialLoginButton(
              image: Assets.imagesGoogleIcon,
              title: 'تسجيل بواسطة جوجل',
              onPressed: () {},
            ),
            const SizedBox(height: 16,),
            SocialLoginButton(
              image: Assets.imagesFacebookIcon,
              title: 'تسجيل بواسطة فيسبوك',
              onPressed: () {},
            ),  
            const SizedBox(height: 16,),
            SocialLoginButton(
              image: Assets.imagesApplIcon,
              title: 'تسجيل بواسطة ابل',
              onPressed: () {},
            ),

          ],
        ),
      ),
    );
  }
}


