import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';

import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'تسجيل دخول',
          arrowBack: false,
        ),
        body: const SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
