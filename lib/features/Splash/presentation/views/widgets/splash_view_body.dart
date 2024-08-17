

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_prefrencess.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
          ),


      ],
    );
  }
  
  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kisOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 1), () {
      if (isOnBoardingViewSeen) {
  Navigator.pushReplacementNamed(context, LoginView.routeName);
}else {
  Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
}
// Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}