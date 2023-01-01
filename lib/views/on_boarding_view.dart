import 'package:flutter/material.dart';
import 'package:shop/models/on_boarding_model.dart';
import 'package:shop/shared/componantes/componantes.dart';
import 'package:shop/shared/componantes/constsants.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
import 'package:shop/shared/widget/text_button.dart';
import 'package:shop/views/login_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'on_boarding_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        title: 'Screen title 1',
        desc: 'Screen body 1',
        image: 'assets/images/Asset 1.png'),
    OnBoardingModel(
        title: 'Screen title 2',
        desc: 'Screen body 2',
        image: 'assets/images/Asset 2.png'),
    OnBoardingModel(
        title: 'Screen title 3',
        desc: 'Screen body 3',
        image: 'assets/images/Asset 4.png'),
  ];

  PageController pageController = PageController();
  bool isLast = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          CustomTextButton(title: 'skip',
           onPressed: (){
            skipOnBoarding(context);
          }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) => OnBoardingItem(
                boarding: boarding[index],
              ),
              itemCount: boarding.length,
              onPageChanged: onPageChange,
            ),
          ),
          const SizedBox(height: 80,),
          Row(
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: boarding.length,
                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 8.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    paintStyle: PaintingStyle.fill,
                    dotColor: Colors.grey,
                    activeDotColor: kPrimaryColor),
              ),
              const SizedBox(
                width: 160,
              ),
              currentIndex == 0
                  ? const Text('')
                  : FloatingActionButton(
                      heroTag: const Text('primary'),
                      elevation: 0,
                      mini: true,
                      onPressed: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
              const Spacer(),
              FloatingActionButton(
                elevation: 0,
                mini: true,
                onPressed: () {
                  if (isLast) {
                    skipOnBoarding(context);
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  void skipOnBoarding(BuildContext context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
     navigateAndFinish(context, ShopLoginView(),);
    });
  }

  void onPageChange(int index) {
              setState(() {
                currentIndex = index;
              });
              if (index == boarding.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }
            }}


