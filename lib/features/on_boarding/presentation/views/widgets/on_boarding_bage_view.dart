import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/bage_view_item.dart';

class OnBoardingBageView extends StatelessWidget {
  const OnBoardingBageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      reverse: true,
      children:  [
        PageViewItem(
          isVisible:(pageController.hasClients ? pageController.page!.round() :0)==0,
          
          img: Assets.imagesPageViewItem1Image,
          background: Assets.imagesPageViewItem1BackgroundImage,
          subtitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مرحبًا بك في',
                style:TextStyles.bold23 ,
              ),
                
                  Text(' HUB',
                  style: TextStyles.bold23.copyWith(color:AppColors.secodaryColor ),
                  ),
                  Text('FRUIT',style: TextStyles.bold23.copyWith(color:AppColors.primaryColor,)),

            ],
          ),
        ),
        PageViewItem(
            isVisible: (pageController.hasClients ? pageController.page!.round() :0)==0,
          img: Assets.imagesPageViewItem2Image,
          background: Assets.imagesPageViewItem2BackgroundImage,
          subtitle: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title:const Text(
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
