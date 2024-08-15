import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';


class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
    required this.title1,
    required this.title2, required this.onTap,
  });
  final String title1, title2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title1,
            style: TextStyles.semiBold16
                .copyWith(color: const Color.fromARGB(255, 121, 129, 130)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap =onTap,
            text: title2,
            style:
                TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
