import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.img,
      required this.background,
      required this.subtitle,
      required this.title, required this.isVisible});
  final String img, background, subtitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(background, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(img),
              ),

              Visibility(
                visible:isVisible ,
                child:  Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'تخطٍ',
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xff949d9e)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
              const SizedBox(
                height: 64,
              ),

        title,
        const SizedBox(
                height: 24,
              ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            
            subtitle,
            textAlign: TextAlign.center ,
            style: TextStyles.semiBold13.copyWith(color: const Color(0xFf4e5456)),
            ),
        ),
      ],
    );
  }
}
