import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.img,
      required this.background,
      required this.subtitle,
      required this.title});
  final String img, background, subtitle;
  final Widget title;

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

              const Text(
                'تخطٍ'
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            
            subtitle,
            textAlign: TextAlign.center ,
            ),
        ),
      ],
    );
  }
}
