import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/bage_view_item.dart';

class OnBoardingBageView extends StatelessWidget {
  const OnBoardingBageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          img: Assets.imagesPageViewItem1Image,
          background: Assets.imagesPageViewItem1BackgroundImage,
          subtitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في'),
                Text('FRUIT'),
                  Text('HUB'),

            ],
          ),
        ),
        PageViewItem(
          img: Assets.imagesPageViewItem2Image,
          background: Assets.imagesPageViewItem2BackgroundImage,
          subtitle: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title:Text(
                'ابحث وتسوق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0C0D0D),
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  height: 0,
                     ),
                 ),
        ),
      ],
    );
  }
}
