import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login_view_body.dart';


class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {}
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          
          isLoading: state is SigninLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
