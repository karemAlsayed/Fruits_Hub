
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/Splash/presentation/views/splash_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';

import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) 
{

  switch (settings.name){

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());


    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }

}